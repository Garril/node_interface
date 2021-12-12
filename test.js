// const crypto = require('crypto'); // node自带

// const md5password = (password) =>{
//   const md5 = crypto.createHash('md5');
//   if(typeof password ==="number") {
//     password = password.toString();
//   }
//   const result = md5.update(password).digest('hex');
//   // md5.update(date) 返回一个对象,加digest(hex)转16进制
//   // 不加hex，得到一个buffer
//   return result;
// }
// const res = md5password(123456);
// console.log(res);



async function foo() {
  console.log(await Promise.resolve('foo'));
}
async function bar() {
  console.log(await 'bar');
}
async function baz() {
  console.log('baz');
}
foo();
bar();
baz();