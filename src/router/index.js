const fs = require('fs');

const useRoutes = (app)=>{
  fs.readdirSync(__dirname).forEach(file=>{ // 遍历router文件夹下文件
    if(file==='index.js') return; // 排除 index.js 自己
    const router = require(`./${file}`);
    app.use(router.routes());
    app.use(router.allowedMethods());
  })
}
module.exports = useRoutes;