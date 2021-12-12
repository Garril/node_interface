const errorType = require('../constants/error-types');
const service = require('../service/user.service');
const md5password= require('../utils/password-handle');

const verifyUser = async(ctx,next)=>{
  // 获取用户名 密码
  const {name, password} = ctx.request.body;
  // 判断 用户名 密码 不能为空
  if( !name || !password) {
    const error = new Error(errorType.NAME_OR_PASSWORD_IS_REQUIRED);
    return ctx.app.emit('error',error,ctx); // 事件，参数，context
  }
  // 判断用户名是否未被注册过
  const result = await service.getUserByName(name);
  if(result.length) { // result是一个数组，有值就非0
    const error = new Error(errorType.USER_ALREADY_EXISTS);
    return ctx.app.emit('error',error,ctx);
  }

  await next();
}

const handlePassword = async (ctx,next) => {
  const { password } = ctx.request.body;
  ctx.request.body.password = md5password(password); //加密之后的密码
  await next();
}

module.exports = {
  verifyUser,
  handlePassword,
}