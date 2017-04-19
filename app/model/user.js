'use strict';

const bcrypt = require('bcrypt-nodejs');

module.exports = app => {
  const { STRING, INTEGER } = app.Sequelize;

  const User = app.model.define('user', {
    name: {
      type: STRING(32),
      allowNull: false,
    },
    email: {
      type: STRING(60),
      validate: {
        isEmail: true,
      },
    },
    password: {
      type: STRING(60),
      validate: {
        len: [ 6, 60 ],
      },
    },
    is_active: {
      type: INTEGER,
      defaultValue: true,
    },
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
      {
        fields: ['email'],
      },
    ],
    classMethods: {
      associate() {
        User.hasOne(app.model.Userprofile);
        User.hasMany(app.model.SocialOauth);
        User.hasMany(app.model.Post);
        User.hasMany(app.model.PostComment);
        User.hasMany(app.model.PostLike);
        User.hasMany(app.model.PostFeedback);
        User.belongsToMany(app.model.School, { as: 'Incharges', through: 'school_managers', foreignKey: 'schoolId' });
      },
    },
    instanceMethods: {
      comparePassword(candidatePassword, callback) {
        bcrypt.compare(candidatePassword, this.password, (err, isMatch) => {
          if (err) {
            return callback(err);
          }
          callback(null, isMatch);
        });
      },
    },
  });

  User.beforeCreate((user, options, fn) => {
    bcrypt.genSalt(10, (err, salt) => {
      if (err) {
        console.log('Error while generating bcrypt salt.');
        console.log(err);
        fn(err, null);
        return;
      }

      bcrypt.hash(user.password, salt, null, (err, hash) => {
        if (err) {
          console.log('Error while generating bcrypt hash.');
          console.log(err);
          fn(err, null);
          return;
        }
        user.password = hash;
        fn(null, user);
        return user;
      });
    });
  });

  return User;

};
