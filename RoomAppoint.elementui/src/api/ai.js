// src/api/ai.js
import request from '@/utils/request'

/**
 * AI智能问答
 */
export function chatWithAI(message) {

    console.log('请求',{question: message  });

    return request({
        url: '/api/ai/chat', // 确认接口地址和后端一致
        method: 'post',
        // 关键修改：参数名从message改为question，和后端入参名匹配

         headers: {
        'Content-Type': 'application/json'  // 确保请求头设置为 JSON
    },


        data: {
            question: message || '' // 兜底：如果message是null，传递空字符串
        }
    })
}

/**
 * AI推荐自习室
 */
export function getAIRecommendation(preference) {
    return request({
        url: '/api/ai/recommend',
        method: 'post',
        data: {
            preference: preference
        }
    })
}

/**
 * 获取AI预约建议
 */
export function getBookingSuggestion(userId) {
    return request({
        url: `/api/ai/suggestion/${userId}`,
        method: 'get'
    })
}