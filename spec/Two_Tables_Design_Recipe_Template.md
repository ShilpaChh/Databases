Two Tables Design Recipe Template FOR CONCERTS AND VENUES tables:

########
# databases/challenges/06_designing_schema_two_tables.md
Ch 6 -> Designing a schema with two tables

# ONE TO MANY RELATIONSHIP
* A musical artist can have many different albums. => Artist -> one to many -> Albums
* While an Album can have only one Artist =>  Album -> many to one -> Artist

FOR FOREIGN KEY, think:
Q. Can one artist have many abums? Yes => So, we need Foreign key on Albums
Q. Can one album have many artists? No 

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

1. Extract nouns from the user stories or specification
As a music promoter,
So I can record a list of all scheduled concerts
With their artist name, concert date and venue

As a music promoter,
So I can organise my concerts,
I want to store the name and capacity for each venue

As a music promoter,
So I can organise my concerts,
I want to kbe able to list all concerts at a given venue.

Nouns:
scheduled concerts, artist name, concert date, venue, venue name, venue capacity

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	    Properties
concerts	artist_name, scheduled_date
venues	    name, cpacity

Name of the first table (always plural): concerts

Column names: artist_name, scheduled_date

Name of the second table (always plural): venues

Column names: name, capacity

3. Decide the column types.
# EXAMPLE:

Table: cencerts
id: SERIAL
artist_name: text
scheduled_date: timestamp

Table: vanues
id: SERIAL
name: text
capacity: int

4. Decide on The Tables Relationship
# EXAMPLE

1. Can one concert have many venues? No
2. Can one venue have many concerets? YES

-> Therefore,
A venue is ONE to MANY Concert
Concert -> many to one -> Venue

SO, FOREIGN KEY HAS TO BE ON CONCERTS - 'venue_id'

-> Therefore, the foreign key is on the albums table.

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE venues (
  id SERIAL PRIMARY KEY,
  name text,
  capacity int
);

-- Then the table with the foreign key.
CREATE TABLE concerts (
  id SERIAL PRIMARY KEY,
  artist_name text,
  scheduled_date timestamp,
-- The foreign key name is always {other_table_singular}_id
  venue_id int,
  constraint fk_venue foreign key(venue_id)
    references venues(id)
    on delete cascade
);


<!-- TablePlus -> copy the two create sql's to create tables -> o/p Query 2 OK: CREATE TABLE -->

<!-- 5. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql -->


##### THIS IS JUST AS AN EG. 
TablePlus -> New -> concerts -> Copy both the create table sql's and run together. This creates the 2 tables in the db, concerts.
