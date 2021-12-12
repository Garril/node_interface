const jwt = require('jsonwebtoken');
const { PRIVATE_KEY } = require('../app/config');

class AuthController {
  
  async login(ctx,next) {
    const { id,name } = ctx.user;
    // token颁发
    const token = jwt.sign({id,name},PRIVATE_KEY,{
      expiresIn: 60*60*24, // 一天
      algorithm: 'RS256'
    });
    ctx.body = {
      id,name,token
    };
  }
  
  async success(ctx,next) {
    ctx.body = "token验证成功，数据请求中。。。"
  }
}

module.exports = new AuthController();