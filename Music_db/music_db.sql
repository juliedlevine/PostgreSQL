create table artist(
  id serial primary key,
  name varchar
);
create table album(
  id serial primary key,
  name varchar,
  year integer check (year between 1000 and 3000)
);
create table song_writer(
  id serial primary key,
  name varchar
);
create table song(
  id serial primary key,
  name varchar,
  length interval minute to second,
  year integer check (year between 1000 and 3000),
  song_writer_id integer references song_writer(id)
);
create table track(
  id serial primary key,
  name varchar,
  length interval minute to second,
  year integer check (year between 1000 and 3000),
  song_id integer references song (id)
);
create table album_artist(
  album_id integer references album (id),
  artist_id integer references artist(id)
);
