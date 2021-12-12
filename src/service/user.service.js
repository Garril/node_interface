const connection = require('../app/database');

class UserService {
  async create(user) {
    const { name, password } = user;
    const statement = `INSERT INTO users (NAME,PASSWORD) VALUES (?,?);`;

    const result = await  connection.execute(statement,[name,password]);
    // 将user存储到数据库
    console.log(user,"存储到数据库成功");
    return result[0];// 这里result是数组，第一个值也是数组，是结果
    // 第二个值也是数组，是一些数据字段
  }

  async getUserByName(name) {
    const statement = `SELECT * FROM users WHERE name = ?;`;
    const result = await connection.execute(statement,[name]);
    return result[0];
  }

  async updateAvatarUrlById(avatarUrl,id) {
    const statement = `UPDATE users SET avatar_url = ? WHERE id = ?;`;
    const [result] = await connection.execute(statement,[avatarUrl,id]);
    return result;
  }

}
module.exports = new UserService();