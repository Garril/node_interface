const service = require('../service/label.service');

const verifyLabelExists = async (ctx,next)=>{
  // 1.取出所有的标签
  const { labels } = ctx.request.body;
  // 2.判断每个标签在label表中是否存在
  const newLabels = [];
  for(let name of labels) {
    const labelResult = await service.isExistLabel(name);
    const label = { name };
    if(!labelResult) {
      const result = await service.create(name);
      label.id = result.insertId;
    }else {
      label.id = labelResult.id;
    }
    newLabels.push(label);
  }
  ctx.labels = newLabels;
  
  await next();
}


module.exports = {
  verifyLabelExists
}