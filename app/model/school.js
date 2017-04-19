'use strict';

module.exports = app => {
  const { STRING } = app.Sequelize;
  const School = app.model.define('school', {
    name: {
      type: STRING(100),
      unique: true,
      allowNull: false,
    },
    description: STRING(255),
    avatar: {
      type: STRING(255),
      validate: {
        isUrl: true,
      },
    },
  }, {
    indexes: [
      {
        fields: ['name'],
      },
    ],
    classMethods: {
      associate() {
        School.hasMany(app.model.Post);
        School.belongsToMany(app.model.User, { as: 'Managers', through: 'school_managers', foreignKey: 'userId' });
      },
    },
  });
  return School;
};
