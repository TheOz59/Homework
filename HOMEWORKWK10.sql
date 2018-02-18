CREATE DATABASE homework_db;


USE sakila;

#1A

Select first_name, last_name from actor;


#1B
Select concat(first_name, " ", last_name) as Actor_Name
from actor;

UPDATE Actor_Name

Set
Actor_Name = Upper(Actor_Name)


#2A
SELECT actor_id, first_name, last_name 
from actor where first_name = 'Joe';

#2B
Select last_name, first_name from actor
 where last_name like '%GEN%';
 
 #2C
 SELECT last_name, first_name from actor
 where last_name like '%LI%'
 Order By last_name;
 
 
 #2D
 
 Select country_id, country from country
 where country IN  ('Afghanistan', 'Bangladesh', 'China');
 
 
 #3A
 
 Alter table actor
 add middle_name varchar(45);
 
 #3B
 Alter table actor
Modify Column middle_name varchar(255);

#3C
Alter table actor
drop middle_name;

#4A

Select last_name
from actor;

Select  count(last_name)
from actor;

#4B
Select last_name
from actor

where count(last_name) > 2;

#4C

update actor
set first_name = 'Harpo' 
where first_name = 'Groucho' and last_name = 'Williams';

#4D

update actor
set first_name = 'Mucho Groucho'
where first_name = 'Harpo' and last_name = 'Williams';

#5A
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='address'

#6a
Select staff.first_name, staff.last_name, staff.address_id
from staf
inner join address on address.address_id = staff.address_id;

#6B
select payment.amount, payment.staff_id, payment.payment_date
from payment
left join staff on staff.staff_id = payment.staff_id
where payment_date like '2005-08-%';

#6C

select film.title, 
count(film_actor.film_id) as NumberOfActors
from film
inner join film_actor on film_actor.actor_id = film.film_id
group by title

#6D

select film.title,  
count(inventory.inventory_id) as NumberOfCopies
from film
inner join inventory on inventory.film_id = film.film_id
where title = "HUNCHBACK IMPOSSIBLE";


#6E

select  distinct c.first_name, c.last_name,
sum(p.amount) as Total
from customer as c
left join payment as p on p.customer_id = c.customer_id
group by c.customer_id
order by last_name;

#7A

select title
from film
where title like 'Q%' or title like 'K%'

#7B

select a.first_name, a.last_name
from actor as a
inner join film_actor as fa on fa.actor_id = a.actor_id
inner join film as f on f.film_id = fa.film_id
where f.title = 'Alone Trip'
group by fa.actor_id
order by a.last_name

#7C

select cu.first_name, cu.last_name, cu.email
from customer as cu
inner join address as a on a.address_id = cu.address_id
inner join city as ci on ci.city_id = a.city_id
inner join country on country.country_id = ci.country_id
where country.country= 'Canada'

#7D
select f.title
from film as f
inner join film_category as fcat on fcat.film_id = f.film_id
inner join category as cat on cat.category_id = fcat.category_id
where cat.name = 'Family'

#7E
select title, rental_rate
from film
order by rental_rate Desc;

#7F

select store.store_id, 
sum(pay.amount) as business
from store 
inner join staff on staff.store_id = store.store_id
inner join payment as pay on pay.staff_id = staff.staff_id
group by store.store_id

#7G
select store.store_id, city.city, country.country
from store
inner join address on address.address_id = store.address_id
inner join  city on city.city_id = address.city_id
inner join country on country.country_id = city.country_id

#7H
select cat.name, 
sum(pay.amount) as gross_rev
from category as cat
inner join film_category on film_category.category_id = cat.category_id
inner join inventory as inv on inv.film_id = film_category.film_id
inner join rental on rental.inventory_id = inv.inventory_id
inner join payment as pay on pay.rental_id = rental.rental_id
group by cat.name
order by gross_rev Desc;

#8A
#. In your new role as an executive, you would like to have an easy way of viewing the 
#Top five genres by gross revenue. 
CREATE VIEW view_top5 as 
select cat.name, 
sum(pay.amount) as gross_rev
from category as cat
inner join film_category on film_category.category_id = cat.category_id
inner join inventory as inv on inv.film_id = film_category.film_id
inner join rental on rental.inventory_id = inv.inventory_id
inner join payment as pay on pay.rental_id = rental.rental_id
group by cat.name
order by gross_rev Desc;

#8B
SELECT * FROM view_top5
LIMIT 5;

#8C
Drop View view_top5;

