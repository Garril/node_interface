const Koa = require('koa');
const app = new Koa();
const bodyParser = require('koa-bodyparser');

const useRoutes = require('../router/index');
const errorHandle = require('./error-handle');

// 中间件的执行是有要求的
app.use(bodyParser());

useRoutes(app);
app.on('error',errorHandle);

module.exports = app;