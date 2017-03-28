-- Restaurant table schema
CREATE TABLE restaurant (
    id serial primary key,
    name varchar,
    address varchar,
    category varchar
);

-- Reviewer table schema
CREATE TABLE reviewer (
    id serial primary key,
    name varchar,
    email varchar,
    karma integer CHECK (karma >= 0) CHECK (karma < 7)
);

-- Review table schema
CREATE TABLE review (
    id serial primary key,
    reviewer_id integer REFERENCES reviewer (id),
    stars integer CHECK (stars > 0) CHECK (stars <= 5),
    title varchar,
    review varchar,
    restaurant_id integer REFERENCES restaurant (id)
);

insert into restaurant values
    (default, 'Tabla', '77 12th Street NE', 'Indian'),
    (default, 'Flying Biscuit Cafe', '1080 Peachtree Street NE', 'Breakfast'),
    (default, 'Lovies BBQ', '12 Main Street SW', 'BBQ'),
    (default, 'South City Kitchen', '102 Crescent Avenue NW', 'Southern'),
    (default, 'NaanStop', '1022 Piedmont Road', 'Indian');

insert into reviewer values
    (default, 'Julie', 'juliemdyer@gmail.com', 7),
    (default, 'James', 'james@gmail.com', 7),
    (default, 'Toby', 'toby@digitalcrafts.com', 6);

insert into review values
    (default, 1, 5, 'Best Indian Food in ATL!', 'I love this place! Definitely my favorite Indian restaurant in ATL, maybe just my favorite restaurant period. My favorite dish is the Shrimp Korma - yum!!', 1);
