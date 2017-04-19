'use strict';

module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;

  const PostComment = app.model.define('post_comment', {
    content: STRING(500),
    num_likes: {
      type: INTEGER,
      defaultValue: 0,
    },
  }, {
    indexes: [
      {
        fields: [{ attribute: 'num_likes', order: 'DESC' }],
      },
    ],
    classMethods: {
      associate() {
        PostComment.belongsTo(app.model.User);
        PostComment.belongsTo(app.model.Post);
        PostComment.belongsTo(app.model.PostComment);
        PostComment.hasMany(app.model.PostLike);
        PostComment.hasMany(app.model.PostComment, {
          foreignKey: {
            onDelete: 'CASCADE',
            allowNull: true,
          },
        });
      },
    },
  });
  return PostComment;
};
