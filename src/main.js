const app = require('./app/index');
const config = require('./app/config');

const connection = require('./app/database');// 连接数据库

app.listen(config.APP_PORT,()=>{
  console.log(`端口:${config.APP_PORT}服务器启动成功~`);
})