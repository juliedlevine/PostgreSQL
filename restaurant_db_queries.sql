-- The favorite dishes of all 4-star restaurants
\! echo "Favorite dishes: ";
SELECT favorite_dish
FROM restaurant
WHERE stars = 4;

-- The the id of a restaurant by a specific restaurant name
\! echo "ID of Flying Biscuit Cafe: ";
SELECT id
FROM restaurant
WHERE name = 'Flying Biscuit Cafe';

-- Restaurants in the category of 'BBQ'
\! echo "BBQ Restaurants: ";
SELECT name
FROM restaurant
WHERE category = 'BBQ';

/* Restaurants that do takeout */
\! echo "Restaurants that do Takeout: ";
SELECT name
FROM restaurant
WHERE does_takeout = True;

-- restaurants that do take out and is in the category of 'BBQ'
\! echo "BBQ Restaurants that do Takeout: ";
SELECT name
FROM restaurant
WHERE does_takeout = True and category = 'BBQ';

-- restaurants within 2 miles
\! echo "Restaurants within 2 miles: ";
SELECT name
FROM restaurant
WHERE distance <= 2;

-- restaurants you haven't ate at in the last week
\! echo "Restaurants you haven't eaten at in the last week and that are 4 stars: ";
SELECT name
FROM restaurant
WHERE
last_time_ate_there not BETWEEN current_date - interval '7 days' AND current_date
OR last_time_ate_there is NULL
AND stars = 4;
