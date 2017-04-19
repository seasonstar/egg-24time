'use strict';

module.exports = app => {
  const PostLike = app.model.define('post_like', {
  }, {
    classMethods: {
      associate() {
        PostLike.belongsTo(app.model.User);
        PostLike.belongsTo(app.model.Post);
        PostLike.belongsTo(app.model.PostComment);
      },
    },
  });
  return PostLike;
};
