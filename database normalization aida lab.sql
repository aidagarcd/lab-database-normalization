-- Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- Define primary keys and foreign keys for the new database.

use sakila;

DESCRIBE actor;
DESCRIBE address;
DESCRIBE backup_table;
DESCRIBE category;
DESCRIBE city;
DESCRIBE country;
DESCRIBE customer;
DESCRIBE deleted_users;
DESCRIBE film;
DESCRIBE film_actor;    -- has two primary keys: actor_id and film_id in film_actor
DESCRIBE film_category; -- has two primary keys: film_id and category_id on film_category
DESCRIBE film_text;
DESCRIBE films_2020;
DESCRIBE inventory;
DESCRIBE language;
DESCRIBE payment;
DESCRIBE rental;
DESCRIBE rentals_june;
DESCRIBE rentals_may;
DESCRIBE staff;
DESCRIBE store;


SELECT
  CONSTRAINT_NAME,
  COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'address'
  AND REFERENCED_TABLE_NAME IS NOT NULL;   -- foreign key:    city_id       in address, backup_table, category, city
  
  SELECT
  CONSTRAINT_NAME,
  COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'customer'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys: adress_id, store_id       in customer
  
  SELECT
  CONSTRAINT_NAME,
  COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'film'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys: language_id and original_language_id       in film, film_actor
  
  SELECT
  CONSTRAINT_NAME,
  COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'film_category'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys:      category_id, film_id    in film_category
  
SELECT
CONSTRAINT_NAME,
COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'inventory'
  AND REFERENCED_TABLE_NAME IS NOT NULL;   -- foreign keys:    film_id, store_id      in inventory
  
SELECT
CONSTRAINT_NAME,
COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'payment'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys: customer_id, rental_id, staff_id       in payment, rental
  
  
SELECT
CONSTRAINT_NAME,
COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'staff'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys: address_id, store_id        in staff
  
  
SELECT
CONSTRAINT_NAME,
COLUMN_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  information_schema.KEY_COLUMN_USAGE
WHERE
  TABLE_SCHEMA = 'sakila'
  AND TABLE_NAME = 'store'
  AND REFERENCED_TABLE_NAME IS NOT NULL;  -- foreign keys    address_id, manager_staff_id        in store

-- PRIMARY KEYS:
-- actor_id and film_id                                           in film_actor
-- film_id and category_id                                        in film_category

-- FOREIGN KEYS:
-- foreign key:      address_id                                   in store, customer, staff
-- foreign key:      manager_staff_id                             in store
-- foreign key:      city_id                                      in address, backup_table, category, city
-- foreign key:      store_id                                     in customer, inventory, staff
-- foreign key:      language_id                                  in film, film_actor
-- foreign key:      original_language_id                         in film, film_actor
-- foreign key:      category_id                                  in film_category
-- foreign key:      film_id                                      in film_category, inventory
-- foreign keys:     customer_id, rental_id, staff_id             in payment, rental

