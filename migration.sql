CREATE DATABASE wishlist;

\c wishlist

CREATE TABLE users (id SERIAL PRIMARY KEY, user_name VARCHAR(255), email VARCHAR(255), password_salt VARCHAR(255), password_hash VARCHAR(255), join_date DATE, is_admin BOOLEAN);

<<<<<<< HEAD
CREATE TABLE wants (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));

CREATE TABLE haves (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));
=======
CREATE TABLE wants (id SERIAL PRIMARY KEY, user_id integer references users(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));

CREATE TABLE haves (id SERIAL PRIMARY KEY, user_id integer references users(id), category VARCHAR(255), description VARCHAR(255), name VARCHAR(255), color VARCHAR(255), size VARCHAR(255), condition VARCHAR(255), location VARCHAR(255));

INSERT INTO user (user_name, email, password_salt)
>>>>>>> df49c809fe06b9c05db8eac61280b6aa685c446e
