const fileService = require('../service/file.service');
const userService = require('../service/user.service');
const { APP_HOST } = require('../app/config');

class FileController {

  async saveAvatarInfo(ctx,next) {
    // 获取图片相关信息
    const { mimetype,filename,size } = ctx.req.file;
    const { id } = ctx.user;
    // 图片信息保存到数据库
    await fileService.createAvatar(mimetype,filename,size,id);
    // 将头像保存到 users 表中
    const avatarUrl = `${APP_HOST}:${APP_PORT}/users/${id}/avatar`;
    await userService.updateAvatarUrlById(avatarUrl,id);

    ctx.body = "用户上传头像成功";
  }

  async savePictureInfo(ctx,next) {
    const { id } = ctx.user;
    // 获取图像信息
    const files = ctx.req.files;
    const { momentId } = ctx.query;
    // 将所有的文件信息保存到数据库中
    for(let file of files) {
      const { mimetype,filename,size } = file;
      await fileService.createFile(id,momentId,mimetype,filename,size);
    }
    ctx.body = '动态配图上传成功!';
  }

}
module.exports = new FileController();