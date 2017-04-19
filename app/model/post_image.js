'use strict';

module.exports = app => {
  const { STRING } = app.Sequelize;

  const PostImage = app.model.define('post_image', {
    url: STRING(255),
  }, {
    classMethods: {
      associate() {
        PostImage.belongsTo(app.model.Post);
        PostImage.belongsTo(app.model.User);
      },
    },
  });

  return PostImage;

};
