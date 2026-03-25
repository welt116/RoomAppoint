<!-- src/components/AIRecommend.vue -->
<template>
  <div class="ai-recommend">
    <button @click="getRecommendation" class="recommend-btn" :disabled="loading">
      <span v-if="!loading">🤖 AI智能推荐</span>
      <span v-else>🔄 推荐中...</span>
    </button>
    
    <transition name="fade">
      <div v-if="recommendation" class="recommendation-card">
        <div class="card-header">
          <h4>✨ AI推荐结果</h4>
          <button @click="recommendation = ''" class="close-btn">×</button>
        </div>
        <div class="card-content">
          <p>{{ recommendation }}</p>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import { getAIRecommendation } from '@/api/ai'

export default {
  name: 'AIRecommend',
  props: {
    userPreference: {
      type: String,
      default: '我想要一个安静、靠窗、有插座的座位'
    }
  },
  data() {
    return {
      recommendation: '',
      loading: false
    }
  },
  methods: {
    async getRecommendation() {
      this.loading = true
      try {
        const response = await getAIRecommendation(this.userPreference)
        if (response.code === 200) {
          this.recommendation = response.data
        } else {
          this.$message.error('获取推荐失败')
        }
      } catch (error) {
        console.error('AI推荐错误:', error)
        this.$message.error('网络错误，请稍后重试')
      } finally {
        this.loading = false
      }
    }
  }
}
</script>

<style scoped>
.ai-recommend {
  margin: 20px 0;
}

.recommend-btn {
  padding: 12px 24px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
  transition: all 0.3s;
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.recommend-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(102, 126, 234, 0.4);
}

.recommend-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.recommendation-card {
  margin-top: 20px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.card-header {
  padding: 16px 20px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-header h4 {
  margin: 0;
  font-size: 16px;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  font-size: 24px;
  cursor: pointer;
  width: 28px;
  height: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: background 0.3s;
}

.close-btn:hover {
  background: rgba(255, 255, 255, 0.2);
}

.card-content {
  padding: 20px;
}

.card-content p {
  margin: 0;
  line-height: 1.8;
  color: #2d3748;
  white-space: pre-wrap;
}

.fade-enter-active, .fade-leave-active {
  transition: all 0.3s ease;
}

.fade-enter-from {
  opacity: 0;
  transform: translateY(-10px);
}

.fade-leave-to {
  opacity: 0;
  transform: translateY(10px);
}
</style>