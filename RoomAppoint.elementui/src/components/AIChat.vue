<!-- src/components/AIChat.vue -->
<template>
  <div class="ai-chat-container">
    <!-- 触发按钮 -->
    <div class="ai-chat-trigger" @click="toggleChat">
      <svg class="icon-robot" viewBox="0 0 1024 1024" width="24" height="24">
        <path d="M512 64C264.6 64 64 264.6 64 512s200.6 448 448 448 448-200.6 448-448S759.4 64 512 64zm0 820c-205.4 0-372-166.6-372-372s166.6-372 372-372 372 166.6 372 372-166.6 372-372 372z" fill="#ffffff"/>
        <path d="M464 336a48 48 0 1 0 96 0 48 48 0 1 0-96 0z m-48 236h192v48H416v-48z" fill="#ffffff"/>
      </svg>
      <span>AI助手</span>
    </div>
    
    <!-- 聊天窗口 -->
    <transition name="slide-up">
      <div class="chat-window" v-show="showChat">
        <div class="chat-header">
          <h3>🤖 AI智能助手</h3>
          <button class="close-btn" @click="showChat = false">×</button>
        </div>
        
        <div class="chat-messages" ref="messagesContainer">
          <div 
            v-for="(msg, index) in messages" 
            :key="index"
            :class="['message', msg.role]"
          >
            <div class="avatar">
              <span v-if="msg.role === 'user'">👤</span>
              <span v-else>🤖</span>
            </div>
            <div class="message-content">
              {{ msg.content }}
            </div>
          </div>
          
          <!-- 加载动画 -->
          <div v-if="loading" class="message assistant">
            <div class="avatar">🤖</div>
            <div class="message-content typing">
              <span></span><span></span><span></span>
            </div>
          </div>
        </div>
        
        <!-- 快捷问题 -->
        <div class="quick-questions" v-if="messages.length <= 1">
          <button 
            v-for="q in quickQuestions" 
            :key="q"
            @click="askQuestion(q)"
            class="quick-btn"
          >
            {{ q }}
          </button>
        </div>
        
        <!-- 输入框 -->
        <div class="chat-input">
          <input 
            v-model="inputMessage"
            @keyup.enter="sendMessage"
            placeholder="有什么可以帮您的？"
            :disabled="loading"
          />
          <button @click="sendMessage" :disabled="loading || !inputMessage.trim()">
            <svg viewBox="0 0 24 24" width="20" height="20">
              <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z" fill="currentColor"/>
            </svg>
          </button>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import { chatWithAI } from '@/api/ai'

export default {
  name: 'AIChat',
  data() {
    return {
      showChat: false,
      messages: [
        { 
          role: 'assistant', 
          content: '您好！我是自习室智能助手，有什么可以帮您的？😊' 
        }
      ],
      inputMessage: '',
      loading: false,
      quickQuestions: [
        '如何预约自习室？',
        '推荐安静的座位',
        '今天有空位吗？',
        '取消预约怎么操作？'
      ]
    }
  },
  methods: {
    toggleChat() {
      this.showChat = !this.showChat
      if (this.showChat) {
        this.$nextTick(() => {
          this.scrollToBottom()
        })
      }
    },
    
 async sendMessage() {
    
  if (!this.inputMessage.trim() || this.loading) return

  const userMessage = this.inputMessage.trim()
  this.messages.push({ role: 'user', content: userMessage })
  this.inputMessage = ''
  this.loading = true

  this.scrollToBottom()


  console.log('userMessage:', userMessage);

  try {
    // 调用接口
    const res = await chatWithAI(userMessage)
    // 关键：正确解析响应（兼容两种情况）
    const result = res.data ? res.data : res; // 若res是axios响应对象，取res.data；否则直接用res
    
    

    if (result.Data ) {
      // 确保内容非空
      const aiContent = result.Data.Data || '抱歉，暂无回答';
      this.messages.push({
        role: 'assistant',
        content: aiContent
      })

      console.log('messages', this.messages)

    } else {
      this.messages.push({
        role: 'assistant',
        content: '抱歉，请求失败'
      })
    }
  } catch (error) {
    console.error('请求错误：', error)
    this.messages.push({
      role: 'assistant',
      content: '网络错误，请重试'
    })
  } finally {
    this.loading = false
    this.scrollToBottom()
  }
},
    
    askQuestion(question) {
      this.inputMessage = question
      this.sendMessage()
    },
    
    scrollToBottom() {
      this.$nextTick(() => {
        const container = this.$refs.messagesContainer
        if (container) {
          container.scrollTop = container.scrollHeight
        }
      })
    }
  }
}
</script>

<style scoped>
.ai-chat-container {
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 9999;
}

.ai-chat-trigger {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  cursor: pointer;
  box-shadow: 0 4px 20px rgba(102, 126, 234, 0.4);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  font-size: 11px;
  transition: all 0.3s;
}

.ai-chat-trigger:hover {
  transform: scale(1.1);
  box-shadow: 0 6px 25px rgba(102, 126, 234, 0.6);
}

.icon-robot {
  margin-bottom: 2px;
}

.chat-window {
  position: absolute;
  bottom: 80px;
  right: 0;
  width: 380px;
  height: 600px;
  background: white;
  border-radius: 16px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.slide-up-enter-active, .slide-up-leave-active {
  transition: all 0.3s ease;
}

.slide-up-enter-from {
  transform: translateY(20px);
  opacity: 0;
}

.slide-up-leave-to {
  transform: translateY(20px);
  opacity: 0;
}

.chat-header {
  padding: 18px 20px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chat-header h3 {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  font-size: 28px;
  cursor: pointer;
  width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: background 0.3s;
}

.close-btn:hover {
  background: rgba(255, 255, 255, 0.2);
}

.chat-messages {
  flex: 1;
  padding: 20px;
  overflow-y: auto;
  background: #f8f9fa;
}

.chat-messages::-webkit-scrollbar {
  width: 6px;
}

.chat-messages::-webkit-scrollbar-thumb {
  background: #cbd5e0;
  border-radius: 3px;
}

.message {
  margin-bottom: 16px;
  display: flex;
  gap: 10px;
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.message.user {
  flex-direction: row-reverse;
}

.avatar {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: white;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  flex-shrink: 0;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.message-content {
  max-width: 70%;
  padding: 12px 16px;
  border-radius: 12px;
  word-wrap: break-word;
  line-height: 1.5;
  font-size: 14px;
}

.message.user .message-content {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-bottom-right-radius: 4px;
}

.message.assistant .message-content {
  background: white;
  color: #2d3748;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  border-bottom-left-radius: 4px;
}

.typing {
  display: flex;
  gap: 4px;
  padding: 16px;
}

.typing span {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: #999;
  animation: typing 1.4s infinite;
}

.typing span:nth-child(2) { animation-delay: 0.2s; }
.typing span:nth-child(3) { animation-delay: 0.4s; }

@keyframes typing {
  0%, 60%, 100% { transform: translateY(0); }
  30% { transform: translateY(-10px); }
}

.quick-questions {
  padding: 12px 16px;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  background: white;
  border-top: 1px solid #e2e8f0;
}

.quick-btn {
  padding: 8px 14px;
  background: #f7fafc;
  border: 1px solid #e2e8f0;
  border-radius: 20px;
  cursor: pointer;
  font-size: 13px;
  color: #4a5568;
  transition: all 0.3s;
}

.quick-btn:hover {
  background: #edf2f7;
  border-color: #667eea;
  color: #667eea;
}

.chat-input {
  display: flex;
  padding: 16px;
  background: white;
  border-top: 1px solid #e2e8f0;
  gap: 10px;
}

.chat-input input {
  flex: 1;
  padding: 12px 16px;
  border: 1px solid #e2e8f0;
  border-radius: 24px;
  outline: none;
  font-size: 14px;
  transition: border-color 0.3s;
}

.chat-input input:focus {
  border-color: #667eea;
}

.chat-input input:disabled {
  background: #f7fafc;
  cursor: not-allowed;
}

.chat-input button {
  width: 44px;
  height: 44px;
  padding: 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
}

.chat-input button:hover:not(:disabled) {
  transform: scale(1.05);
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
}

.chat-input button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .chat-window {
    width: calc(100vw - 40px);
    height: calc(100vh - 120px);
    right: 20px;
  }
  
  .ai-chat-trigger {
    right: 20px;
    bottom: 20px;
  }
}
</style>