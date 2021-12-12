const errorType = require('../constants/error-types');
const userService = require('../service/user.service');
const authService = require('../service/auth.service');

const md5password = require('../utils/password-handle');
const { PUBLIC_KEY } = require('../app/config');
const jwt = require('jsonwebtoken');

// 登录
const verifyLogin = async (ctx,next)=>{
  // 拿到用户名密码
  const { name,password } = ctx.request.body;
  // 判断 用户名密码是否为空
  if( !name || !password) {
    const error = new Error(errorType.NAME_OR_PASSWORD_IS_REQUIRED);
    return ctx.app.emit('error',error,ctx);
  }
  // 判断用户是否存在
  const result = await userService.getUserByName(name);
  const user = result[0];

  if(!user) {
    const error = new Error(errorType.USER_NOT_EXISTS);
    return ctx.app.emit('error',error,ctx);
  }
  // 判断密码是否和数据库中一致
  if(md5password(password) !== user.password) {
    const error = new Error(errorType.USER_PASSWORD_ERROR);
    return ctx.app.emit('error',error,ctx);
  }

  // 这里验证成功了，进行token颁发,把用户信息先传给login中间件
  ctx.user = user;

  await next();
}

// 是否有发表动态等的权限
const verifyAuth = async(ctx,next) =>{
  // 获取token
  const authorization = ctx.headers.authorization;
  const token = authorization.replace('Bearer ','');
  if(!token) {
    const error = new Error(errorType.UNAUTHORIZATION);
    ctx.app.emit('error',error,ctx);
  }
  // 验证token(id/name/exp/..)
  try{
    const result = jwt.verify(token,PUBLIC_KEY,{
      algorithms: ['RS256']
    });
    ctx.user = result;
    await next();
  }catch(err) { // error会报错
    const error = new Error(errorType.UNAUTHORIZATION);
    ctx.app.emit('error',error,ctx);
  }
}

// 查询是否有修改动态/评论等等的权限
const verifyPermission = (tableName) => {
  return async(ctx,next) => {
    // 拿到用户的id和动态的id
    const { id } = ctx.user;
    const key = Object.keys(ctx.params);
    const commentId = ctx.params[key];
    // 查询是否有权限
    try {
      const isPremission = await authService.checkResource(tableName,commentId,id);
      if(!isPremission) throw new Error();
      await next();
    }catch(err) {
      const error = new Error(errorType.UNPERMISSION);
      return ctx.app.emit('error',error,ctx);
    }
  }
}




module.exports = {
  verifyLogin,
  verifyAuth,
  verifyPermission,
}