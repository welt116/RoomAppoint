import store from "@/store";
import { getToken } from "@/utils/cache";
import axios from "axios";
import { Message } from "element-ui";

// create an axios instance
const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API, // 请求的url地址
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 60000, // AI接口可能需要更长时间，改为60秒
});

// request interceptor
service.interceptors.request.use(
  (config) => {
    let token = getToken();
    if (token) {
      config.headers["Authorization"] = token;
    }
    return config;
  },
  (error) => {
    // do something with request error
    console.log(error); // for debug
    return Promise.reject(error);
  }
);

// response interceptor
service.interceptors.response.use(
  (response) => {
    const res = response.data;
    
    // 兼容两种返回格式
    // 格式1: {Success, Code, Msg} - 你的现有接口
    // 格式2: {code, message, data} - AI接口（标准格式）
    
    // 判断是哪种格式
    if (res.hasOwnProperty('Success')) {
      // 原有格式处理
      let { Success, Code, Msg } = res;

      if (Success == true) {
        return res;
      } else {
        if (Code == 500) {
          Message({
            message: Msg,
            type: "error",
            duration: 5 * 1000,
          });
          return res;
        } else if (Code == 401) {
          Message({
            message: "用户信息已过期",
            type: "error",
            duration: 5 * 1000,
          });
          store.dispatch("Logout").then(() => {
            location.reload();
          });
          return Promise.reject(new Error(Msg || "Error"));
        } else {
          return Promise.reject(new Error(Msg || "Error"));
        }
      }
    } else if (res.hasOwnProperty('code')) {
      // 新格式处理（AI接口）
      let { code, message, data } = res;
      
      if (code === 200) {
        // 成功
        return res;
      } else if (code === 401) {
        // 未授权
        Message({
          message: message || "用户信息已过期",
          type: "error",
          duration: 5 * 1000,
        });
        store.dispatch("Logout").then(() => {
          location.reload();
        });
        return Promise.reject(new Error(message || "Error"));
      } else {
        // 其他错误
        Message({
          message: message || "请求失败",
          type: "error",
          duration: 5 * 1000,
        });
        return Promise.reject(new Error(message || "Error"));
      }
    } else {
      // 未知格式，直接返回
      return res;
    }
  },
  (error) => {
    //如果网络错误就是后端没有启动
    if (error.message && error.message.indexOf("Network Error") != -1) {
      Message({
        message: "后端服务没有启动",
        type: "error",
        duration: 5 * 1000,
      });
      return Promise.reject(new Error(error.message || "Error"));
    }

    // 处理超时错误
    if (error.message && error.message.indexOf("timeout") != -1) {
      Message({
        message: "请求超时，请稍后重试",
        type: "error",
        duration: 5 * 1000,
      });
      return Promise.reject(new Error("请求超时"));
    }

    console.log("err" + error); // for debug
    Message({
      message: error.message || "请求出错",
      type: "error",
      duration: 5 * 1000,
    });
    return Promise.reject(error);
  }
);

export default service;