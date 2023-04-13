const express = require("express");
const app = express();
const MpUploadOssHelper = require("../oss_get/uploadOssHelper.js");
const config = require('../app/config');

app.get("/getOss", (req, res) => {
  const mpHelper = new MpUploadOssHelper({
    // 阿里云账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM用户进行API访问或日常运维，请登录RAM控制台创建RAM用户并授权。
    accessKeyId: "LTAI5tBq8epxqTdCB6HaeGn5",
    accessKeySecret: "yRxa7bjlCQ9Cq4iRTrwuTP3zMpVtO8",
    // 限制参数的生效时间，单位为小时，默认值为1。
    timeout: 1,
    // 限制上传文件大小，单位为MB，默认值为10。
    maxSize: 10,
  });

  // 生成参数。
  const params = mpHelper.createUploadParams();

  res.json(params);
});
app.listen(config.APP_PORT,()=>{
  console.log(`端口:${config.APP_PORT}服务器启动成功~`);
})