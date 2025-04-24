 SHOW TABLES;
 
#SELECT * FROM customer;
SELECT * FROM customer LIMIT 10;

select * from ACTOR_INFO where first_name='BOB';
SELECT * from language;
#join customer with payments
SELECT * from actor_info;
select c.first_name,c.last_name,p.amount,p.payment_date
from customer c
join payment p on c.customer_id=p.customer_id;

#longest and shortest movies
select title,length
from film
order by length desc
limit 15;
#movies longer than the average length
SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

#total and average revenue  by store
select s.store_id,
sum(p.amount) as total_revenue,
avg(p.amount) as avg_payment
from payment p
join staff s on p.staff_id=s.staff_id
group by s.store_id;

#view
create view  customer_payments as
select customer_id , sum(amount) as total_paid
from payment
group by customer_id;
select * from customer_payments;

#view:total revenue from each staff member
create view staff_revenue as
select staff_id, SUM(amount) AS total_revenue
from payment
group by staff_id;
select *  from staff_revenue;

#index
select * from rental;
select * from rental where date(rental_date)='2005-05-24';
explain select * from rental where date(rental_date)='2005-05-24';
SHOW INDEX FROM rental;




