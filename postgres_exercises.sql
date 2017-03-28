-- Many side (left) has foreign key pointing to 1 side (right) primary key
-- join condition has many = one


-- Left Outer Join
select
    *
from
    article --left table. all rows in left table must be represented even if we couldnt find a joining row on the right table. Articles taht dont have an author show up anyway
left outer join
    author on article.author_id = author.id; -- right table


-- Right Outer Join
-- force every row that exists on the right to exist. For authors that dont have any articles, show them anyway.
select
    *
from
    article
right outer join
    author on article.author_id = author.id;


-- Full outer join
-- shows both sides of the tables, even if neither of them have a match.
-- Not used very often
select
    *
from
    article
full outer join
    author on article.author_id = author.id;


-- MANY TO MANY
-- Inject an associative table in the middle. It's actually two 1 to many relationships.
