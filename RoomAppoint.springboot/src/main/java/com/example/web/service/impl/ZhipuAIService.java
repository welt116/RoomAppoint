package com.example.web.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.example.web.config.ZhipuAIConfig;
import com.example.web.service.AIService;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class ZhipuAIService implements AIService {

    private final OkHttpClient client;
    private final ZhipuAIConfig config;

    @Autowired
    public ZhipuAIService(ZhipuAIConfig config) {
        this.config = config;
        this.client = new OkHttpClient.Builder()
                .connectTimeout(30, TimeUnit.SECONDS)
                .readTimeout(30, TimeUnit.SECONDS)
                .writeTimeout(30, TimeUnit.SECONDS)
                .build();
    }

    @Override
    public String chat(String question) {
        String systemPrompt = "你是自习室预约系统的智能助手，帮助用户解答关于预约、座位选择、时间安排等问题。";
        // 新增：打印入参日志，定位参数为空的原因
        log.info("chat方法接收的用户问题：{}", question);
        // 空值处理：trim后如果为空，给一个默认问题（也可返回提示）
        question = getValidUserInput(question, "请问自习室怎么预约？");
        return callZhipuAI(systemPrompt, question);
    }

    @Override
    public String recommendStudyRoom(String userPreference) {
        String systemPrompt = "你是自习室推荐专家。根据用户偏好推荐最合适的自习室和座位。";
        log.info("recommendStudyRoom方法接收的用户偏好：{}", userPreference);
        userPreference = getValidUserInput(userPreference, "推荐一个安静的自习室");
        return callZhipuAI(systemPrompt, userPreference);
    }

    @Override
    public String generateBookingSuggestion(String userHistory) {
        String systemPrompt = "分析用户历史预约数据，生成个性化的预约建议。";
        log.info("generateBookingSuggestion方法接收的用户历史：{}", userHistory);
        userHistory = getValidUserInput(userHistory, "我的历史预约时间是晚上7点，推荐合适的座位");
        return callZhipuAI(systemPrompt, userHistory);
    }

    /**
     * 处理用户输入的空值问题，返回有效输入
     * @param userInput 用户原始输入
     * @param defaultInput 默认输入（当用户输入为空时使用）
     * @return 有效输入
     */

    private String getValidUserInput(String userInput, String defaultInput) {
        // 1. 处理null：抛出异常或返回提示文本，而不是直接替换
        if (userInput == null) {
            log.warn("用户输入为null，未接收到用户有效输入");
            // 返回提示文本，让AI告知用户输入无效
            return "用户未输入有效问题，请重新输入";
        }
        // 2. 处理空字符串/全空格：同样返回提示文本
        String trimmedInput = userInput.trim();
        if (trimmedInput.isEmpty()) {
            log.warn("用户输入为空字符串/全空格，无有效输入");
            return "用户未输入有效问题，请重新输入";
        }
        // 3. 有效输入：返回trim后的值
        return trimmedInput;
    }
    /**
     * 调用智谱AI接口
     */
    private String callZhipuAI(String systemPrompt, String userMessage) {
        try {
            // 构建消息数组
            JSONArray messages = new JSONArray();

            // 系统消息：确保content非空
            JSONObject systemMsg = new JSONObject();
            systemMsg.put("role", "system");
            systemMsg.put("content", systemPrompt);
            messages.add(systemMsg);

            // 用户消息：确保content非空且trim处理
            JSONObject userMsg = new JSONObject();
            userMsg.put("role", "user");
            userMsg.put("content", userMessage);
            messages.add(userMsg);

            // 构建请求体：严格遵循参数规范
            JSONObject requestBody = new JSONObject();
            // 1. 模型名称：确保是平台支持的名称（去除多余空格）
            String modelName = (config.getModel() == null) ? "glm-4-flashx" : config.getModel().trim();
            requestBody.put("model", modelName);
            // 2. 消息数组：必选参数
            requestBody.put("messages", messages);
            // 3. stream：非必选，默认false（显式设置，避免歧义）
            requestBody.put("stream", false);
            // 4. max_tokens：限制取值范围（1~32768）
            int maxTokens = config.getMaxTokens() == null ? 2048 : config.getMaxTokens();
            maxTokens = Math.max(1, Math.min(32768, maxTokens)); // 确保在合法范围
            requestBody.put("max_tokens", maxTokens);
            // 5. temperature：限制取值范围（0~2）
            double temperature = config.getTemperature() == null ? 0.7 : config.getTemperature();
            temperature = Math.max(0.0, Math.min(2.0, temperature)); // 确保在合法范围
            requestBody.put("temperature", temperature);
            // 可选：注释top_p参数，减少参数错误概率（如果需要再开启）
            // double topP = 0.7;
            // requestBody.put("top_p", Math.max(0.0, Math.min(1.0, topP)));

            // 打印请求参数（便于调试）
            log.info("智谱AI请求参数：{}", requestBody.toJSONString());
            log.info("智谱AI配置 - baseUrl: {}, model: {}, key: {}",
                    config.getBaseUrl(), modelName,
                    config.getKey() != null && config.getKey().length() > 6
                            ? config.getKey().substring(0, 6) + "****"
                            : "空");

            // 直接使用配置中的完整baseUrl
            String requestUrl = config.getBaseUrl();
            log.info("最终请求地址：{}", requestUrl);

            // 构建HTTP请求
            Request request = new Request.Builder()
                    .url(requestUrl)
                    .addHeader("Authorization", "Bearer " + config.getKey())
                    .addHeader("Content-Type", "application/json; charset=utf-8")
                    .post(RequestBody.create(
                            requestBody.toJSONString(),
                            MediaType.parse("application/json; charset=utf-8")
                    ))
                    .build();

            // 发送请求并处理响应
            try (Response response = client.newCall(request).execute()) {
                if (!response.isSuccessful()) {
                    String responseBody = response.body() != null ? response.body().string() : "null";
                    log.error("智谱AI API调用失败: {}, response: {}", response.code(), responseBody);
                    return "抱歉，AI助手暂时无法回答，请稍后再试。";
                }

                String responseBody = response.body().string();
                log.info("智谱AI响应: {}", responseBody);

                JSONObject jsonResponse = JSON.parseObject(responseBody);

                // 解析响应
                JSONArray choices = jsonResponse.getJSONArray("choices");
                if (choices != null && !choices.isEmpty()) {
                    JSONObject firstChoice = choices.getJSONObject(0);
                    JSONObject message = firstChoice.getJSONObject("message");
                    if (message != null) {
                        String content = message.getString("content");
                        return content != null ? content : "抱歉，AI助手未返回有效内容。";
                    }
                }

                log.error("智谱AI响应格式异常: {}", responseBody);
                return "抱歉，AI助手返回了异常的响应格式。";
            }

        } catch (Exception e) {
            log.error("智谱AI接口调用异常", e);
            return "抱歉，服务出现异常：" + e.getMessage();
        }
    }



}