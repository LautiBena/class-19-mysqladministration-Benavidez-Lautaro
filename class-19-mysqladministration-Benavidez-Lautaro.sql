-- 1 
create user 'data_analyst'@'localhost';

-- 2 
grant select, update, delete on sakila.* to 'data_analyst'@'localhost';

-- 3
use sakila;

create table prueba (
    id int primary key,
    nombre varchar(50)
);

-- ERROR 1142 (42000): CREATE command denied to user 'data_analyst' 
-- esto pasa porque no tiene permisos de create el usuario, habria que darselos con grant

-- 4 

update sakila.film
set title = 'lichi aprobame :(, no use chat'
where film_id = 1;

-- si deja ejecutar esto porque le dimos el permiso de update en el punto 2

-- 5

revoke update on sakila.* from 'data_analyst'@'localhost';

-- 6 

update sakila.film
set title = 'lichi aprobame :(, no use chat: la secuela'
where film_id = 1;

-- ERROR 1142 (42000): UPDATE command denied to user 'data_analyst'
-- ya no va a dejar actualizar nada porque en el punto 5 le sacamos los permisos.
