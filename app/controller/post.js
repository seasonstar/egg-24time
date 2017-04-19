'use strict';

module.exports = app => {
  class PostController extends app.Controller {
    * create() {
      const { ctx, service } = this;
      const createRule = {
        content: { type: 'string' },
        schoolId: { type: 'id' },
        is_anonymous: { type: 'boolean' },
      };
      // 校验参数
      ctx.validate(createRule);
      // 组装参数
      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);
      // 调用 Service 进行业务处理
      const req = Object.assign(ctx.request.body, { user });
      const res = yield service.post.create(req);
      // 设置响应内容和响应状态码
      ctx.body = { id: res.id };
      ctx.status = 201;
    }

    * list() {
      const { ctx } = this;
      const page = parseInt(ctx.query.page) || 0;
      const page_size = parseInt(ctx.query.page_size) || 12;

      const school = yield ctx.model.School.findById(ctx.params.schoolId);
      if (!school) {
        ctx.body = {
          code: -1,
          msg: '该学校不存在',
          data: {
            school: null,
            posts: [],
          },
        };
        return;
      }
      const posts = yield school.getPosts({
        offset: page * page_size,
        limit: page_size,
        attributes: { exclude: ['title', 'updatedAt'] },
        where: {
          is_valid: true,
        },
        order: [[ 'createdAt', 'DESC' ]],
        include: [
          { model: ctx.model.User, attributes: ['id', 'name', 'avatar'] },
          { model: ctx.model.PostImage, as: 'images', attributes: ['url'] },
        ],
      });

      ctx.body = {
        code: 0,
        msg: 'ok',
        data: { school, posts },
      };
    }

    * show() {
      const { ctx } = this;

      const post = yield ctx.model.Post.findOne({
        attributes: { exclude: ['title', 'updatedAt', 'schoolId', 'userId'] },
        where: {
          id: ctx.params.postId,
        },
        include: [
          { model: ctx.model.User, attributes: ['id', 'name', 'avatar'] },
          { model: ctx.model.School, attributes: ['id', 'name', 'avatar'] },
          { model: ctx.model.PostImage, as: 'images', attributes: ['url'] },
        ],
      });
      if (!post) {
        ctx.body = { code: -1, msg: '该帖子不存在', data: { post: null, comments: [] } };
        return;
      }
      const comments = yield ctx.model.PostComment.findAll({
        attributes: { exclude: ['userId', 'postId', 'updatedAt'] },
        order: [[ 'createdAt', 'ASC' ]],
        where: {
          postId: ctx.params.postId,
        },
        include: [
          { model: ctx.model.User, attributes: ['id', 'name', 'avatar'] },
        ],
      });
      ctx.body = { code: 0, msg: 'ok', data: { post, comments } };
    }

    * destroy() {
      const { ctx } = this;
      // 组装参数
      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);
      // 调用 Service 进行业务处理
      // 设置响应内容和响应状态码
      const post = yield ctx.model.Post.findOne({
        where: {
          id: ctx.params.postId,
          userId: user.id,
        },
      });
      if (post) {
        post.is_valid = false;
        post.save();
        ctx.body = { code: 0, msg: 'ok' };
      } else {
        ctx.body = { code: -1, msg: '你无权删除此贴' };

      }
    }

    * like() {
      const { ctx } = this;
      const userInfo = yield ctx.service.user.checkWeappUser();
      console.log(userInfo);
      const user = yield ctx.service.user.getOauthUser(userInfo);

      let created = false;
      let like = yield ctx.model.PostLike.findOne({
        where: {
          postId: ctx.params.postId,
          userId: user.id,
        },
      });
      if (!like) {
        like = yield ctx.model.PostLike.create({
          postId: ctx.params.postId,
          userId: user.id,
        });
        created = true;
      }
      const post = yield ctx.model.Post.findById(like.postId);
      if (!created) {
        // 赞过后就撤销赞;
        post.num_likes -= 1;
        like.destroy();
      } else {
        post.num_likes += 1;
      }
      post.save();
      ctx.body = { code: 0, msg: 'ok', data: { favor: created } };
    }

    * report() {
      const { ctx } = this;
      const createRule = {
        subject: { type: 'string' },
      };
      ctx.validate(createRule);

      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);

      const report = yield ctx.model.PostFeedback.create({
        postId: ctx.params.postId,
        subject: ctx.request.body.subject,
        userId: user.id,
      });

      // 设置响应内容和响应状态码
      ctx.body = { id: report.id };
      ctx.status = 201;
    }
  }
  return PostController;
};
