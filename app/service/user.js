'use strict';

module.exports = app => {
  class UserService extends app.Service {

    constructor(ctx) {
      super(ctx);
      this.models = this.ctx.model;
    }

    * checkWeappUser() {
      const { app, request, response } = this.ctx;
      const loginService = app.weapp.LoginService.create(request, response);
      const weapp_user = yield loginService.check();
      return weapp_user.userInfo;
    }

    * getOauthUser(userInfo, site = 'WEAPP') {
      const oauth_user = yield this.models.SocialOauth.findOne({
        where: {
          site_uid: userInfo.openId,
        },
      });
      if (!oauth_user) {
        const user = yield this.createUser(site, userInfo);
        return user;
      }
      const user = yield this.models.User.findOne({
        attributes: ['id', 'name', 'avatar'],
        where: {
          id: oauth_user.userId,
        },
      });
      user.oauth = oauth_user;
      return user;
    }

    * createUser(site, userInfo) {
      const user = yield this.models.User.create({
        name: userInfo.nickName,
        avatar: userInfo.avatarUrl,
      });
      const oauth = yield this.models.SocialOauth.create({
        site,
        site_uid: userInfo.openId,
        site_uname: userInfo.nickName,
        unionid: userInfo.unionId,
        userId: user.id,
      });
      yield this.models.Userprofile.create({
        sex: userInfo.gender,
        city: userInfo.city,
        province: userInfo.province,
        country: userInfo.country,
        userId: user.id,
      });
      user.oauth = oauth;
      return user;

    }

  }
  return UserService;
};
