package com.example.web.controller;

import com.example.web.service.AIService;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/ai")
@CrossOrigin
public class AIController {

    @Autowired
    private AIService aiService;

    /**
     * 智能问答
     */
    @PostMapping("/chat")
    public Result chat(@RequestBody ChatRequest request) {

        System.out.println("Received request body: " + request);  // 调试输出
        System.out.println("Received question: " + request.getQuestion());  // 确认 question 是否正常

        String answer = aiService.chat(request.getQuestion());
        return Result.success(answer);
    }

    /**
     * 推荐自习室
     */
    @PostMapping("/recommend")
    public Result recommend(@RequestBody RecommendRequest request) {
        String recommendation = aiService.recommendStudyRoom(request.getPreference());
        return Result.success(recommendation);
    }
}




// 请求对象
@Data
class ChatRequest {



    @JsonProperty("question")
    private String question;





}

@Data
class RecommendRequest {
    private String preference;
}

// 统一返回结果（如果你已有Result类，使用你的）
@Data
class Result {
    private Integer code;
    private String message;
    private Object data;

    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(200);
        result.setMessage("success");
        result.setData(data);
        return result;
    }
}
