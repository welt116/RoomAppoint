package com.example.web.service;

/**
 * AI服务接口
 */
public interface AIService {

    /**
     * 智能问答
     */
    String chat(String question);

    /**
     * 推荐自习室
     */
    String recommendStudyRoom(String userPreference);

    /**
     * 生成预约建议
     */
    String generateBookingSuggestion(String userHistory);
}