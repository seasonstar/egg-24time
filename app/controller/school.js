'use strict';

const pinyin = require('../utils/pinyin');

function grouped(arr, key) {
  const groups = {};
  for (let i = 0; i < arr.length; i++) {
    const item = arr[ i ];
    const firstChar = item[key].charAt(0);

    groups[ firstChar ] = groups[ firstChar ] || [];
    groups[ firstChar ].push(item);
  }

  const segs = [];
  Object.keys(groups).forEach(key => {
    segs.push({ letter: key, data: groups[key] });
  });
  segs.sort((a, b) => a.letter > b.letter);
  return segs;
}

module.exports = app => {
  class SchoolController extends app.Controller {
    * list() {
      const { ctx, app } = this;
      let sortedList = yield app.redis.get('api_schools');
      sortedList = JSON.parse(sortedList);
      if (!sortedList) {
        const schools = yield ctx.model.School.findAll({
          attributes: { exclude: ['title', 'updatedAt'] },
          order: [[ 'name', 'DESC' ]],
        });

        schools.map(item => {
          item.pinyin = pinyin.getCamelChars(item.name);
          return item;
        });
        sortedList = JSON.stringify(grouped(schools, 'pinyin'));
        // 缓存24小时
        app.redis.set('api_schools', sortedList, 'PX', 1000 * 60 * 60 * 24);
      }
      ctx.body = {
        code: 0,
        msg: 'ok',
        data: { schools: sortedList },
      };
    }
  }
  return SchoolController;
};
