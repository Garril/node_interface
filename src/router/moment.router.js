const Router = require('koa-router');

const momentRouter = new Router({prefix:'/moment'});

const {
  create,
  detail,
  list,
  update,
  remove,
  addLabels,
  fileInfo
} = require('../controller/moment.control.js');

const {
  verifyAuth,
  verifyPermission
} = require('../middleware/auth.middleware.js');

const {
  verifyLabelExists
} = require('../middleware/label.middleware.js');

momentRouter.post('/',verifyAuth,create);
momentRouter.get('/',list);
momentRouter.get('/:momentId',detail);
// 用户修改动态
momentRouter.patch('/:momentId',verifyAuth,verifyPermission("moment"),update);
momentRouter.delete('/:momentId',verifyAuth,verifyPermission("moment"),remove);
// 用户给动态添加标签
momentRouter.post('/:momentId/labels',verifyAuth,verifyPermission("moment"),verifyLabelExists,addLabels);
momentRouter.get('/images/:filename',fileInfo);

module.exports = momentRouter;