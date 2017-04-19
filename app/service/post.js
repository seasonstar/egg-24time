'use strict';

module.exports = app => {
  class PostService extends app.Service {

    constructor(ctx) {
      super(ctx);
      this.models = this.app.model;
    }

    * create(params) {
      const post = yield this.models.Post.create({
        content: params.content,
        schoolId: params.schoolId,
        is_anonymous: params.is_anonymous,
        userId: params.user.id,
      });
      const images = params.images;
      if (images && images.length > 0) {
        images.forEach(url => {
          this.models.PostImage.create({
            url,
            postId: post.id,
            userId: params.user.id,
          });
        });
      }
      return post;
    }

  }
  return PostService;
};
