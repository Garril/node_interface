const fs = require('fs');

const momentService = require('../service/moment.service');
const fileService = require('../service/file.service');
const { PICTURE_PATH } = require('../constants/file-path');

class MomentController {
  
  async create(ctx,next) {
    // 1.获取数据（user_id,content）
    const content = ctx.request.body.content;
    const userId = ctx.user.id;
    const result = await momentService.create(userId,content);
    ctx.body = result;
  }

  async detail(ctx,next) {
    const momentId = ctx.params.momentId;
    const result = await momentService.getMomentById(momentId);
    ctx.body = result;
  }

  async list(ctx,next) {
    const { offset,size } = ctx.query;
    const result = await momentService.getMomentList(offset,size);
    ctx.body = result;
  }
  
  async update(ctx,next) {
    const { momentId } = ctx.params;
    const { content } = ctx.request.body;
    const result = await momentService.updateMoment(content,momentId);
    ctx.body = result;
  }

  async remove(ctx,next) {
    const { momentId } = ctx.params;
    const result = await momentService.removeMoment(momentId);
    ctx.body = result;
  }
  
  async addLabels(ctx,next) {
    // 获取标签和动态的id，标签若不存在，在之前就已经创建了新的
    const { labels } = ctx;
    const { momentId } = ctx.params;
    // 判断标签是否原本就在动态上了
    for(let label of labels) {
      const isExist = await momentService.hasLabel(momentId,label.id);
      if(!isExist) {
        await momentService.addLabel(momentId,label.id);
      }
    }
    ctx.body = "给动态添加标签成功";
  }

  async fileInfo(ctx,next) {
    let { filename } = ctx.params; // 记得，是let不是const
    const fileInfo = await fileService.getFileByFilename(filename);
    const { type } = ctx.query;
    const types = ["small","middle","large"];
    if(types.some( item => item === type)) {//返回的是一个Boolean类型
      filename = filename + '-' + type;
    }
    ctx.response.set('content-type',fileInfo.mimetype);
    ctx.body = fs.createReadStream(`${PICTURE_PATH}/${filename}`);
  }

}

module.exports = new MomentController();