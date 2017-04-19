'use strict';

module.exports = app => {
  const { STRING, ENUM } = app.Sequelize;

  const PostFeedback = app.model.define('post_feedback', {
    subject: STRING(50),
    status: {
      type: ENUM,
      values: ['PENDING', 'PROCESSED', 'REFUSED'],
      defaultValue: 'PENDING',
    },
  }, {
    indexes: [
      {
        fields: ['subject'],
      },
      {
        fields: ['status'],
      },
    ],
    classMethods: {
      associate() {
        PostFeedback.belongsTo(app.model.User);
        PostFeedback.belongsTo(app.model.Post);
      },
    },
  });
  return PostFeedback;
};
