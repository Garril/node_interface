const dotenv = require('dotenv');
const fs = require('fs');
const path = require('path');

dotenv.config();

/* console.log(process.env.APP_PORT); */
const PRIVATE_KEY = fs.readFileSync(path.resolve(__dirname,'./key/private.key'));
const PUBLIC_KEY = fs.readFileSync(path.resolve(__dirname,'./key/public.key'));

module.exports = {
  APP_PORT,
  APP_HOST,
  MYSQL_HOST,
  MYSQL_PORT,
  MYSQL_DATABASE,
  MYSQL_ROOT,
  MYSQL_PASSWORD
} = process.env; // 把 process.env 中的 APP_PORT 导出

module.exports.PRIVATE_KEY = PRIVATE_KEY;
module.exports.PUBLIC_KEY = PUBLIC_KEY;