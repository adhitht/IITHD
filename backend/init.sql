DROP TABLE IF EXISTS events
DROP TABLE IF EXISTS feed

CREATE TABLE events (shortname VARCHAR(100), title VARCHAR(255), time TIME, date DATE,color VARCHAR(255));

CREATE TABLE feed (id INT,title VARCHAR(255), organiser VARCHAR(100), publish_date DATE, description VARCHAR(500), mddescription VARCHAR(5000), buttons VARCHAR(1000));
