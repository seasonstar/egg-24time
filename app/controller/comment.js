'use strict';

module.exports = app => {
  class PostCommentController extends app.Controller {
    * create() {
      const { ctx } = this;
      const createRule = {
        content: { type: 'string' },
      };
      ctx.validate(createRule);

      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);
      const post = yield ctx.model.Post.findById(ctx.params.postId);

      post.update({ num_comments: post.num_comments + 1 });

      const comment = yield ctx.model.PostComment.create({
        content: ctx.request.body.content,
        postId: ctx.params.postId,
        userId: user.id,
      });
      // 设置响应内容和响应状态码
      ctx.body = { id: comment.id };
      ctx.status = 201;
    }

    * reply() {
      const { ctx } = this;
      const createRule = {
        content: { type: 'string' },
      };
      ctx.validate(createRule);

      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);

      const reply = yield ctx.model.PostComment.create({
        content: ctx.request.body.content,
        postId: ctx.params.postId,
        postCommentId: ctx.params.commentId,
        userId: user.id,
      });

      // 设置响应内容和响应状态码
      ctx.body = { id: reply.id };
      ctx.status = 201;
    }

    * like() {
      const { ctx } = this;

      const userInfo = yield ctx.service.user.checkWeappUser();
      const user = yield ctx.service.user.getOauthUser(userInfo);

      const like = yield ctx.model.PostLike.create({
        postId: ctx.params.postId,
        postCommentId: ctx.params.commentId,
        userId: user.id,
      });

      // 设置响应内容和响应状态码
      ctx.body = { id: like.id };
      ctx.status = 201;
    }
  }
  return PostCommentController;
};
