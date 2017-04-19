'use strict';

module.exports = app => {
  const { STRING, TEXT, INTEGER, BOOLEAN } = app.Sequelize;

  const Post = app.model.define('post', {
    title: STRING(50),
    content: TEXT,
    is_anonymous: {
      type: BOOLEAN,
      allowNull: false,
      defaultValue: false,
    },
    is_valid: {
      type: BOOLEAN,
      allowNull: false,
      defaultValue: true,
    },
    num_likes: {
      type: INTEGER,
      defaultValue: 0,
    },
    num_comments: {
      type: INTEGER,
      defaultValue: 0,
    },
    num_views: {
      type: INTEGER,
      defaultValue: 0,
    },
  }, {
    indexes: [
      {
        fields: ['is_valid'],
      },
      {
        fields: ['is_anonymous'],
      },
      {
        fields: ['createdAt'],
      },
      {
        fields: [{ attribute: 'num_likes', order: 'DESC' }],
      },
      {
        fields: [{ attribute: 'num_views', order: 'DESC' }],
      },
      {
        fields: [{ attribute: 'num_comments', order: 'DESC' }],
      },
    ],
    classMethods: {
      associate() {
        Post.belongsTo(app.model.School);
        Post.belongsTo(app.model.User);
        Post.hasMany(app.model.PostComment, { as: 'comments' });
        Post.hasMany(app.model.PostLike, { as: 'likes' });
        Post.hasMany(app.model.PostImage, { as: 'images' });
      },
    },
  });

  return Post;
};
