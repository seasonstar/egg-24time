# egg-24time

微信小程序社区功能全栈解决方案，配合以下项目使用:

> [egg-24time](https://github.com/seasonstar/egg-24time)

后端使用Egg，Mysql，Redis，基于Nodejs开发，全套代码使用ES6编写

> [weapp-24time](https://github.com/seasonstar/weapp-24time)

微信小程序端

> [egg-weapp-sdk](https://github.com/seasonstar/egg-weapp-sdk)

egg的微信小程序的用户会话管理插件，客户端需配合腾讯云出品的[qcloud-weapp-client-sdk](https://github.com/tencentyun/weapp-client-sdk)使用，Redis保存会话信息


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
