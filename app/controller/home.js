'use strict';

module.exports = function* () {
  const model = this.model;
  console.log(model);
  // User create
  /**
  const user = yield model.User.sync({ force: true }).then(function() {
    return model.User.create({
      name: 'seasonstar',
      email: 'seasonstar@126.com',
      password: 'tang98',
    });
  });

  // School create
  const school = yield model.School.sync({ force: true }).then(function() {
    return model.School.create({
      name: '中山大学',
      avatar: 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/9e0f6abcjw1e8qgp5bmzyj2050050aa8.jpg',
    });
  });

  // Post create
  model.Post.sync({ force: true }).then(function() {
    return model.Post.create({
      content: '测试测试',
      userId: user.id,
      schoolId: school.id,
    });
  });

  // Comment create
  const user = yield model.User.findOne();
  const post = yield model.Post.findOne();
  yield model.PostComment.sync({ force: true }).then(() => {
    return model.PostComment.create({
      content: '测试评论0',
      postId: post.id,
      userId: user.id,
    });
  });
  const comment = yield model.PostComment.create({
    content: '测试评论1',
    postId: post.id,
    userId: user.id,
  });
  yield model.PostComment.create({
    content: '测试评论2',
    postId: post.id,
    userId: user.id,
    postCommentId: comment.id,
  });

  // social oauth create
  yield model.SocialOauth.sync({ force: true }).then(function() {
    return model.SocialOauth.create({
      site: 'WEAPP',
      userId: user.id,
    });
  });

  // userprofile create
  yield model.Userprofile.sync({ force: true }).then(function() {
    return model.Userprofile.create({
      userId: user.id,
    });
  });

  // postimage create
  yield model.PostImage.sync({ force: true }).then(function() {
    return model.PostImage.create({
      url: 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/9e0f6abcjw1e8qgp5bmzyj2050050aa8.jpg',
      postId: post.id,
    });
  });

  // post feedback create
  yield model.PostFeedback.sync({ force: true }).then(function() {
    return model.PostFeedback.create({
      subject: '不良信息举报',
      status: 'PENDING',
      postId: post.id,
      userId: user.id,
    });
  });

  // post like create
  yield model.PostLike.sync({ force: true }).then(function() {
    return model.PostLike.create({
      postId: post.id,
      userId: user.id,
    });
  });

  const user = yield model.User.findOne();
  const school = yield model.School.findOne();
  yield model.models.school_managers.sync({ force: true }).then(function() {
    return model.models.school_managers.create({
      userId: user.id,
      schoolId: school.id,
    });
  });
  **/

  this.body = 'Hello World';
};
