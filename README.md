# egg-24time

微信小程序社区功能全栈解决方案，配合以下项目使用:

> [egg-24time](https://github.com/seasonstar/egg-24time)

后端使用Egg，Mysql，Redis，基于Nodejs开发，全套代码使用ES6编写

> [weapp-24time](https://github.com/seasonstar/weapp-24time)

微信小程序端

> [egg-weapp-sdk](https://github.com/seasonstar/egg-weapp-sdk)

egg的微信小程序的用户会话管理插件，客户端需配合腾讯云出品的[qcloud-weapp-client-sdk](https://github.com/tencentyun/weapp-client-sdk)使用，Redis保存会话信息

--------------------

本示例包含：

1. 微信小程序登录示例
2. 进行带会话的网络请求示例
2. 基于腾讯云COS上传图片或文件的示例
3. 发送帖子，点赞，举报，删除帖子示例


## QuickStart

### Development

```shell
git clone https://github.com/seasonstar/egg-24time.git
cd egg-24time
```

Config Redis and Mysql on [config/config.default.js](config/config.default.js)

```javascript
  config.redis = {
    client: {
      host: '127.0.0.1',
      port: '6379',
      password: '',
      db: '0',
    },
  };

  config.sequelize = {
    dialect: 'mysql', // support: mysql, mariadb, postgres, mssql
    database: 'tftime',
    host: 'localhost',
    port: '3306',
    username: 'root',
    password: '',
  };

  config.weappSDK = {
    appId: '', // your weapp appId
    appSecret: '', // weapp appSecret
  };

  // Qcloud Cloud Object Storage
  config.cos = {
    secretId: '',
    secretKey: '',
    appId: '',
    bucket: '',
    folder: '',
  };
```

Import test data into Mysql

```shell
mysql -u root -p  < db.sql
```

```shell
$ npm install
$ npm run dev
$ open http://localhost:7001/
```

### Deploy

Use `EGG_SERVER_ENV=prod` to enable prod mode

```shell
$ EGG_SERVER_ENV=prod npm start
```

or `EGG_SERVER_ENV=prod nohup node index.js > stdout.log 2> stderr.log &` run quietly

### npm scripts

- Use `npm run autod` to auto detect dependencies upgrade
- Use `npm run lint` to check code style
- Use `npm test` to run unit test


## Credits && Inspiration

[cos-auth](https://github.com/tencentyun/cos-auth)

[wafer-node-server-sdk](https://github.com/tencentyun/wafer-node-server-sdk)

## LICENSE

[MIT](LICENSE)

Please Open Issues if you have troubles.
