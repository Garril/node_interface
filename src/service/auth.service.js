const connection = require('../app/database');

class AuthService {
  // 查询是否有修改权限
  async checkResource(tableName,momentId,userId) {
    try{
      const statement = 
      `SELECT * FROM ${tableName} WHERE id = ? AND user_id = ?;`;
      const [result] = await connection.execute(statement,[momentId,userId]);
      return result.length===0? false:true;
    }catch(err) {
      console.log(err);
    }
  }

}

module.exports = new AuthService();