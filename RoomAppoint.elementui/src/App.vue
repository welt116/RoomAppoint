<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>

export default {
  name: 'App',

}
</script>

<style>
@import './css/index.css';
@import "./css/font/iconfont.css";



html,
body {
  background-color: rgb(141, 114, 191);
}

.bg-header {
  background-color: #8a52a6;
  display: flex;
  height: 60px;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  box-shadow: 0px 4px 8px rgba(212, 38, 38, 0.066);
  color: rgb(255, 255, 255);
}

/* -xs -sm  -md  -lg*/

.pointer {
  cursor: pointer;
}


.card {
  box-shadow: 0 2px 4px rgba(219, 31, 31, 0.094), 0 0 6px rgba(0, 0, 0, .04);
  height: 100%;
  border-radius: 10px;
  padding: 20px;
  background: white;
}


.margin-top-xs {
  margin-top: 5px;
}

.margin-top-lg {
  margin-top: 20px;
}

.margin-bottom-xs {
  margin-bottom: 5px;
}

.margin-bottom-lg {
  margin-bottom: 20px;
}
</style>



<!-- src/App.vue -->
<template>
  <div id="app">
    <router-view/>
    
    <!-- 添加AI聊天助手 -->
    <AIChat />
  </div>
</template>

<script>
import AIChat from '@/components/AIChat.vue'

export default {
  name: 'App',
  components: {
    AIChat
  }
}
</script>