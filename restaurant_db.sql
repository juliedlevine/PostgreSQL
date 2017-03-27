-- Create Table and values
CREATE TABLE restaurant (
    id serial primary key,
    name varchar,
    distance integer,
    stars integer,
    category varchar,
    favorite_dish varchar,
    does_takeout boolean,
    last_time_ate_there date
);


-- Insert Data
insert into restaurant values
    (default, 'Tabla', 1, 4, 'Indian', 'Shrimp Korma', True, '2017-03-25'),
    (default, 'South City Kitchen', 1, 4, 'Southern', 'Fried Chicken', True, '2017-02-21'),
    (default, 'Lovies BBQ', 2, 3, 'BBQ', 'Brisket Sandwich', True, null),
    (default, 'NaanStop', 0, 2, 'Indian', 'Chicken Tikka Masala', True, '2017-03-24'),
    (default, 'Flying Biscuit Cafe', 1, 3, 'Breakfast', 'Famous Flying Biscuit Breakfast', True, '2016-10-01');
