-- List all the reviews for a given restaurant given a specific restaurant ID.
SELECT *
FROM review
WHERE review.restaurant_id = 1;


-- List all the reviews for a given restaurant, given a specific restaurant name.
SELECT *
FROM review, restaurant
WHERE review.restaurant_id = restaurant.id AND restaurant.name = 'Tabla';


-- List all the reviews for a given reviewer, given a specific author name.
SELECT name, review
FROM review, reviewer
WHERE review.reviewer_id = reviewer.id AND reviewer.name = 'Julie';


-- List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.
SELECT name, review
FROM review, restaurant
WHERE review.restaurant_id = restaurant.id ORDER BY restaurant.name desc;


-- Get the average stars by restaurant. The result should have the restaurant name and its average star rating.
SELECT name, avg(stars)
FROM review, restaurant
WHERE review.restaurant_id = restaurant.id
GROUP BY name;


-- Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.
SELECT name, count(review)
FROM review, restaurant
WHERE review.restaurant_id = restaurant.id
GROUP BY name;


--List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.
SELECT restaurant.name, review.review, reviewer.name
FROM restaurant, review, reviewer
WHERE review.restaurant_id = restaurant.id AND review.reviewer_id = reviewer.id;


--Get the average stars given by each reviewer. (reviewer name, average star rating)
SELECT reviewer.name, avg(review.stars)
FROM reviewer, review
WHERE review.reviewer_id = reviewer.id
GROUP BY reviewer.id;


-- Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)
SELECT reviewer.name, min(review.stars) from reviewer, review  WHERE review.reviewer_id = reviewer.id
GROUP BY reviewer.id;


-- Get the number of restaurants in each category. (category name, restaurant count)
SELECT restaurant.category, count(*) from restaurant GROUP BY restaurant.category;


-- Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)
SELECT restaurant.name, count(stars) from restaurant, review WHERE review.restaurant_id = restaurant.id AND review.stars = 5 GROUP BY restaurant.id;


-- Get the average star rating for a food category. (category name, average star rating)
SELECT restaurant.category, avg(stars) from restaurant, review WHERE review.restaurant_id = restaurant.id
GROUP BY restaurant.category;
