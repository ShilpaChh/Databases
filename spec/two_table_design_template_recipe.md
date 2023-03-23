Two Tables Design Recipe Template
Copy this recipe template to design and create two related database tables from a specification.

1. Extract nouns from the user stories or specification
# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.


Nouns:

Student names, cohort names, cohorts’ starting dates

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.
Record
Properties
students
name
cohort
name, starting_date
	1	Name of the first table (always plural): studentsColumn names: name
	2	Name of the second table (always plural): cohortsColumn names: name, starting_date

3. Decide the column types.
Here's a full documentation of PostgreSQL data types.
Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.
Remember to always have the primary key id as a first column. Its type will always be SERIAL.
# EXAMPLE:

Table: students
id: SERIAL
Name: text


Table: cohorts
id: SERIAL
name: text
starting_date: date

4. Decide on The Tables Relationship
Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.
To decide on which one, answer these two questions:
	1	Can a student have many cohorts? (Yes/No): NO
	2	Can a cohort have many students? (Yes/No): YES

Student -> Many to one -> Cohort

-> Therefore, the foreign key is on the students table (cohort_id)

If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

4. Write the SQL.
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  starting_date date
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  Name text,
-- The foreign key name is always {other_table_singular}_id
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id)
    references cohorts(id) 
	on delete cascade 
);

NOTE: 
Configuring "Cascade" Deletion
When a record is deleted (e.g when a row in artists is deleted), we can configure the database to automatically remove related records referencing it (e.g delete all related albums), so there are no "orphans" records - this is done using the on delete cascade SQL option, when creating the table:


TablePlus -> New -> Copy both the Create table sql's _. Ctrl + A -> this create both the tables -> Refresh (cmd + R) to confirm. 

<!-- 5. Create the tables.
psql -h 127.0.0.1 database_name < albums_table.sql -->



