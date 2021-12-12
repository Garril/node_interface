const connection = require('../app/database');

class fileService {

  async createAvatar(mimetype,filename,size,userId) {
    const statement =
    `INSERT INTO avatar (mimetype,filename,size,user_id) VALUES (?,?,?,?);`;
    const [result] = await connection.execute(statement,[mimetype,filename,size,userId]);
    return result;
  }

  async getAvatarByUserId(userId) {
    const statement = `SELECT * FROM avatar WHERE user_id = ?;`;
    const [result] = await connection.execute(statement,[userId]);
    return result[0];
  }

  async createFile(userid,momentId,mimetype,filename,size) {
    try{
      const statement = `INSERT INTO file (user_id,moment_id,mimetype,filename,size) VALUES (?,?,?,?,?);`;
      const [result] = await connection.execute(statement,[userid,momentId,mimetype,filename,size]);
      return result;
    }catch(err) {
      console.log(err);
    }
  }
  
  async getFileByFilename(filename) {
    const statement = `SELECT * FROM file WHERE filename = ?;`;
    const [result] = await connection.execute(statement,[filename]);
    return result[0];
  }

}
module.exports = new fileService();