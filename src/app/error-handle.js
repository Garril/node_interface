const errorTypes = require('../constants/error-types');

const errorHandle = (error,ctx)=>{
  let status,message;
  // 方便处理多种类型的错误
  switch(error.message){
    case errorTypes.NAME_OR_PASSWORD_IS_REQUIRED:
      status = 400; // Bad Request
      message = "用户名密码不能为空~";
      break;
    case errorTypes.USER_ALREADY_EXISTS:
      status = 409; // conflict
      message = "用户名已经存在~";
      break;
    case errorTypes.USER_NOT_EXISTS:
      status = 400; // 参数错误 Bad Request
      message = "用户名不存在~";
      break;
    case errorTypes.UNAUTHORIZATION:
      status = 401;
      message = "无效token~";
      break;
    case errorTypes.USER_PASSWORD_ERROR:
      status = 400;
      message = "密码错误~";
      break;
    case errorTypes.UNPERMISSION:
      status = 401;
      message = "您的权限不足~";
      break;
    default:
      status = 404;
      message = "NOT FOUND";
  }
  ctx.status = status;
  ctx.body = message;
}
module.exports = errorHandle;