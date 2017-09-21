select first_name, last_name from "user" where date_part('year', date_of_birth) > 2000 ORDER BY first_name DESC;

select biography from "user" where biography like '% man %';

select u.first_name, u.last_name, c.type, c.value from "user" u join contact c on u.id = c.user_id where u.id = 3;

select first_name from "user" where id IN(1, 3);

select first_name, last_name, count(user_id) from "user" join contact on contact.user_id = "user".id group by "user".first_name, "user".last_name;
