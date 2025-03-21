-- regenerates duckdb database from raw files
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS listings;
DROP TABLE IF EXISTS profiles;

CREATE TABLE applications AS SELECT * FROM 'data/raw/applications.csv';
CREATE TABLE assignments  AS SELECT * FROM 'data/raw/assignments.csv';
CREATE TABLE users        AS SELECT * FROM 'data/raw/users.csv';
CREATE TABLE reviews      AS SELECT * FROM 'data/raw/reviews.csv';
CREATE TABLE pets         AS SELECT * FROM 'data/raw/pets.csv';
CREATE TABLE feedback     AS SELECT * FROM 'data/raw/feedback.csv';
CREATE TABLE listings     AS SELECT * FROM 'data/raw/listings.csv';
CREATE TABLE profiles     AS SELECT * FROM 'data/raw/profiles.csv';

