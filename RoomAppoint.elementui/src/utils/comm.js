import { Message, MessageBox, Loading } from "element-ui"; //消息提示框
import store from "@/store";
import router from "@/router";

/**
 * 公共确认提示框
 * @param {*} config
 * @returns
 */
export function ConfirmMessageBox(config) {
  let _config = {
    title: config.title || "提示",
    content: config.content || "",
  };
  return new Promise(function (resolve, reject) {
    MessageBox.confirm(_config.content, _config.title, {
      confirmButtonText: "确定",
      cancelButtonText: "取消",
      type: "warning",
    })
      .then(() => {
        resolve(true);
      })
      .catch(() => {
        resolve(false);
      });
  });
}

/**
 * 获取路径中的文件名称
 */
export function GetFileNameByPath(path) {
  return window.GetFileNameByPath(path);
}
/**
 * 获取路径中的文件格式
 */
export function GetFileTypeByPath(path) {
  return window.GetFileTypeByPath(path);
}
/**
 * 切割字段返回一个集合
 * @param {*} value 需要切割字段
 * @param {*} cutting 切割的符号
 */
export function ConvertArray(value = "", cutting = ",") {
  return window.ConvertArray(value, cutting);
}
/**
 * 根据路径获取文件的详细信息
 */
export function FullConvertUrlArray(value = "", cutting = ",") {
  var arr = ConvertArray(value, cutting);

  arr = arr.map((x) => {
    return {
      url: ReplaceImageHttp(x),
      name: GetFileNameByPath(x),
      type: GetFileTypeByPath(x),
    };
  });
  return arr;
}
/**
 * 处理图片路径
 * @param {*} value
 * @returns
 */
export function ReplaceImageHttp(value) {
  return window.ReplaceImageHttp(value);
}

/**
 * 得到完整的时间格式 年-月-日 时分秒
 */
export function YMDHMSFormat(val) {
  return window.YMDHMSFormat(val);
}
/**
 * 得到完整的时间格式 年-月-日
 */
export function YMDFormat(val) {
  return window.YMDFormat(val);
}

/**
 * 得到时分秒格式
 */
export function HMSFormat(val) {
  return window.HMSFormat(val);
}
/**
 * 获取相对时间描述
 * @param {Date|string|number} date 要比较的时间
 * @returns {string} 返回相对时间描述
 */
export function GetRelativeTimeDesc(date) {
  return window.GetRelativeTimeDesc(date);
}

/**
 * 检查是否登录状态
 * @returns
 */
export function CheckIsLogin() {
  if (!store.getters.Token) {
    setTimeout(() => {
      router.push("/login");
    }, 500);
    Message({
      showClose: true,
      message: "请先登录后,再操作",
      type: "error",
    });
    return false;
  }
  return true;
}

export default {
  CheckIsLogin,
  ConfirmMessageBox,
  ConvertArray,
  FullConvertUrlArray,
  GetFileNameByPath,
  GetFileTypeByPath,
  ReplaceImageHttp,
  YMDHMSFormat,
  YMDFormat,
  HMSFormat,
  GetRelativeTimeDesc,
};
