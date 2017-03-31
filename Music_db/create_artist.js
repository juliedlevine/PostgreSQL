var Promise = require('bluebird');
var config = require('./config.js');
var pgp = require('pg-promise')({
    promiseLib: Promise
});
var prompt = require('prompt-promise');
var db = pgp({
  host: config.host,
  database: config.database,
  user: config.user,
  password: config.password
});

function create_artist() {
    return prompt('Artist name? ')
        .then(function(artist) {
            var insert = "insert into artist values(default, " + "'" + artist + "'" + ") returning id";
            prompt.end();
            return [artist, db.one(insert)];
        })
        .spread(function(artist, result) {
            console.log('Created artist ' + artist + ' with ID ' + result.id);
            return prompt('Do you want to create another artist? (y/n)');
        })
        .then(function(answer) {
            if (answer === 'y') {
                create_artist();
            } else {
                console.log('Bye!');
                prompt.finish();
                pgp.end();
            }
        })
        .catch(function rejected(err) {
          console.log('error:', err.message);
          prompt.finish();
          pgp.end();
        });
}
create_artist();
