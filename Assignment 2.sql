
select count(rental_id) from rental;
select avg (datediff (return_date, rental_date)) as AverageRentalDuration from rental;
select upper(first_name) as FirstName, upper( last_name) as LastName from customer;
select rental_id, month(rental_date) as RentalMonth from rental;
select customer_id, count(rental_id) from rental group by customer_id ;
select store.store_id, sum(amount) as total
 from store 
 left join staff on store.store_id left join payment on staff.staff_id 
 group by store.store_id;
select film.title as MovieTitle,
    customer.first_name as CustomerFirstName,
    customer.last_name as CustomerLastName
from 
    rental
join
    inventory on rental.inventory_id = inventory.inventory_id
join
    film on inventory.film_id = film.film_id
join 
    customer on rental.customer_id = customer.customer_id;
select actor.first_name as actor_name
 from actor
 join 
 film_actor on actor.actor_id = film_actor.actor_id
 join
 film 
 on film_actor.film_id= film.film_id
 where film.title like "Gone with the Wind";
select  film_category.category_id,
Count(*) as Rental_Count
from film_category
join 
film
on  film_category.film_id = film.film_id
join
inventory 
on film_category.film_id= inventory.film_id
join
rental
on 
inventory.inventory_id= rental.inventory_id
group by 
    film_category.category_id;
select language.name as Language,
    avg(film.rental_rate) as Average_Rental_Rate
from 
    film
join
    language 
    on film.language_id = language.language_id
group by
    language.name;
select customer.customer_id,
    customer.first_name,
    customer.last_name,
Sum(payment.amount) as total
from
customer
join 
payment on customer.customer_id = payment.customer_id
group by 
customer.customer_id, customer.first_name, customer.last_name;
Select
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    city.city,
    film.title as MovieTitle
    from
    customer
join 
    address on customer.address_id = address.address_id
join
    city on address.city_id = city.city_id
join
    rental on customer.customer_id = rental.customer_id
join
    inventory on rental.inventory_id = inventory.inventory_id
join
    film on inventory.film_id = film.film_id
where
    city.city = 'London'
order by 
    customer.customer_id, film.title, city.city;
Select
    film.title as MovieTitle,
    count(rental.rental_id) as RentalCount
from 
    film
join
    inventory on film.film_id = inventory.film_id
join
    rental on inventory.inventory_id = rental.inventory_id
group by 
    film.title
order by
    RentalCount desc
limit 5;

Select 
    customer.customer_id,
    customer.first_name,
    customer.last_name
from 
    customer
join
    rental on customer.customer_id = rental.customer_id
join
    inventory on rental.inventory_id = inventory.inventory_id
join
    store on inventory.store_id = store.store_id
where
    store.store_id in (1, 2)
group by 
    customer.customer_id, customer.first_name, customer.last_name
having
    COUNT(distinct store.store_id)= 2;
    
    

