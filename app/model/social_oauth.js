'use strict';

module.exports = app => {
  const { STRING, DATE } = app.Sequelize;

  const SITE_NAME = {
    WEAPP: 'WEAPP',
    WECHAT: 'WECHAT',
    WEIBO: 'WEIBO',
  };

  const SocialOauth = app.model.define('social_oauth', {
    site: {
      type: STRING(32),
      defaultValue: SITE_NAME.WEAPP,
    },
    site_uid: STRING(255),
    unionid: STRING(255),
    site_uname: STRING(255),

    access_token: STRING(255),
    refresh_token: STRING(255),
    expire_date: DATE,
  }, {
    indexes: [
      {
        fields: ['site_uid'],
      },
      {
        fields: ['unionid'],
      },
    ],
    classMethods: {
      associate() {
        SocialOauth.belongsTo(app.model.User);
      },
    },
  });

  return SocialOauth;

};
