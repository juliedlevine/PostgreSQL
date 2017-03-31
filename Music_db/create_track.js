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

function create_track() {
    return prompt('Track name? ')
        .then(function(track) {
            return [track, prompt('Album ID? ')];
        })
        .spread(function(track, album_id) {
            return [track, album_id, prompt('Song ID? ')];
        })
        .spread(function(track, album_id, song_id) {
            return [track, album_id, song_id, prompt('Track Duration? (Enter in format 00:00:00) ')];
        })
        .spread(function(track, album_id, song_id, duration) {
            return [track, album_id, song_id, duration, prompt('Track Year? ')];
        })
        .spread(function(track, album_id, song_id, duration, year) {
            var insert = "insert into track values(default, " + "'" + track + "'" + ", " + "'" + duration + "'" + ", " + year + ", " + song_id + ", " + album_id + ") returning id";
            return [track, db.one(insert)];
        })
        .spread(function(track, result) {
            console.log('Created track ' + track + ' with ID ' + result.id);
            return prompt('Do you want to create another track? (y/n) ');
        })
        .then(function(answer) {
            if (answer === 'y') {
                create_track();
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

create_track();
