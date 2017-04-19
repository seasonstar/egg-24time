'use strict';

const fs = require('fs');
const path = require('path');

module.exports = appInfo => {
  const config = {};

  // should change to your own
  config.keys = appInfo.name + '_1489816290616_7711';


  config.siteFile = {
    '/favicon.ico': fs.readFileSync(path.join(appInfo.baseDir, 'app/public/favicon.png')),
  };

  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };

  config.redis = {
    client: {
      host: '127.0.0.1',
      port: '6379',
      password: '',
      db: '0',
    },
  };

  config.sessionRedis = {
    name: '', // single redis does not need to config name
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

  config.security = {
    csrf: {
      ignoreJSON: true, // 默认为 false，当设置为 true 时，将会放过所有 content-type 为 `application/json` 的请求
    },
  };

  // Qcloud Cloud Object Storage
  config.cos = {
    secretId: '',
    secretKey: '',
    appId: '',
    bucket: '',
    folder: '',
  };

  return config;
};
