module.exports = {
  db: process.env.MONGO_URL || 'mongodb://localhost:27017/SBDoc',
  filePath: './file',
  imgPath: './image',
  tempPath: './temp',
  port: 10000,
  version: '1.1.9'
}
