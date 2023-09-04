-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/gsUiP3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots (.. - without quotes).

DROP DATABASE craigslist
CREATE DATABASE craigslist
\c craigslist

CREATE TABLE users (
    user_id SERIAL  NOT NULL ,
    username VARCHAR(20)  NOT NULL ,
    preferred_region TEXT  NOT NULL ,
    posts TEXT  NOT NULL ,
    PRIMARY KEY (
        user_id
    )
);

CREATE TABLE region (
    region_id SERIAL  NOT NULL ,
    name TEXT  NOT NULL ,
    PRIMARY KEY (
        region_id
    )
);

CREATE TABLE posts (
    posts_id SERIAL  NOT NULL ,
    title TEXT  NOT NULL ,
    description TEXT  NOT NULL ,
    user_id INTEGER  NOT NULL ,
    post_location TEXT  NOT NULL ,
    post_region TEXT  NOT NULL ,
    category TEXT  NOT NULL ,
    PRIMARY KEY (
        posts_id
    )
);

CREATE TABLE categories (
    category_id SERIAL  NOT NULL ,
    name TEXT  NOT NULL ,
    PRIMARY KEY (
        category_id
    )
);

ALTER TABLE users ADD CONSTRAINT fk_users_preferred_region FOREIGN KEY('preferred_region')
REFERENCES region ('region_id');

ALTER TABLE users ADD CONSTRAINT 'fk_users_posts' FOREIGN KEY('posts')
REFERENCES posts ('posts_id');

ALTER TABLE posts ADD CONSTRAINT 'fk_posts_user_id' FOREIGN KEY('user_id')
REFERENCES 'users' ('user_id');

ALTER TABLE posts ADD CONSTRAINT 'fk_posts_post_region' FOREIGN KEY('post_region')
REFERENCES region ('region_id');

ALTER TABLE posts ADD CONSTRAINT 'fk_posts_category' FOREIGN KEY('category')
REFERENCES categories ('category_id');


INSERT INTO users (username, preferred_region)
VALUES ('user1', 'Denver'), ('user2', 'New York'), ('users3', 'Seattle');

INSERT INTO region (name)
VALUES ('Las Vegas', 'Denver', 'St. Louis', 'New York', 'Baltimore', 'Seattle', 'Boston');

INSERT INTO categories (name)
VALUES ('community', 'services', 'housing', 'for sale', 'jobs', 'discussion forums');