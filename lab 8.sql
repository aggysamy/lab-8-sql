use sakila;
#3
select c.Name, count(film_id) as cat_count
from category c
INNER JOIN film_category F
ON c.category_id = F.category_id
Group by c.name
order by cat_count desc;
#4
select actor.first_name, actor.last_name, count(film_id) as movie_count
from actor
INNER JOIN film_actor
on actor.actor_id = film_actor.actor_id
group by actor.first_name, actor.last_name
order by movie_count desc;
#5
select c.first_name, c.last_name, count(rental_id) as number_of_rentals
from customer c
inner join rental
on c.customer_id = rental.customer_id
group by c.first_name, c.last_name
order by number_of_rentals desc
limit 1;
select title, length, rating, RANK() OVER (partition by rating order by length desc)as 'rank'
from film;
where length > 0;