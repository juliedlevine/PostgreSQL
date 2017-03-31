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

function create_album() {
    return prompt('Album name? ')
        .then(function(album) {
            return [album, prompt('Album Year? ')];
        })
        .spread(function(album, year) {
            return [album, year, prompt('Artist ID? ')];
        })
        .spread(function(album, year, id) {
            var insert = "insert into album values(default, " + "'" + album + "'" + ", " + year + ", " + id + ") returning id";
            return [album, db.one(insert)];
        })
        .spread(function(album, result) {
            console.log('Created album ' + album +  ' with ID ' + result.id);
            return prompt('Do you want to create another album? (y/n)');
        })
        .then(function(answer) {
            if (answer === 'y') {
                create_album();
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

create_album();
