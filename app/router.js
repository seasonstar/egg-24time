'use strict';

module.exports = app => {
  app.get('/home', 'home');

  // user
  app.get('/login', app.controller.weapp.login);
  app.get('/user', app.controller.weapp.user);
  app.get('/cos_auth', app.controller.weapp.cos_auth);

  // posts
  app.post('/v1/posts', 'post.create');
  app.get('/v1/posts/:postId', 'post.show');
  app.get('/v1/posts/schools/:schoolId', 'post.list');
  app.post('/v1/posts/:postId/like', 'post.like');
  app.post('/v1/posts/:postId/report', 'post.report');
  app.delete('/v1/posts/:postId', 'post.destroy');

  // comment
  app.post('/v1/posts/:postId/comment', 'comment.create');
  app.post('/v1/posts/:postId/comment/:commentId/like', 'comment.like');
  app.post('/v1/posts/:postId/comment/:commentId/reply', 'comment.reply');

  // school
  app.get('/v1/schools', 'school.list');
};
