---#######################################################################
---Q1:Prepare script to create table1 and table2 with primary key
---Query:-
CREATE TABLE the_store_table (
    store_id int NOT NULL,
    manager_staff_id int NOT NULL,
    address_id int NOT NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(store_id)
);
---Output:-
---store_id	manager_staff_id	address_id	last_update

CREATE TABLE the_staff_table (
    staff_id int NOT NULL,
    first_name varchar(250) NOT NULL,
    last_name varchar(250) NOT NULL,
    address_id int NOT NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(staff_id),
    ---#######################################################################
    ---Q2:Prepare script to add foreign key constraint on any one table
    ---Query:-
  	FOREIGN key (staff_id) REFERENCES the_store_table(store_id)
);
---Output:-
---staff_id	first_name	last_name	address_id	last_update

---#######################################################################
---Q4:Prepare script to add index to any column
---Query:-
INSERT INTO the_store_table VALUES(1, 1,1, "2022-12-04")
---Output:-
---store_id	manager_staff_id	address_id	last_update
---1	      1	                1	          2022-12-04

INSERT INTO the_staff_table VALUES(1, "santosh","prabu",01,"2022-12-04")
---Output:-
---staff_id first_name	last_name	address_id	last_update
---1	      santosh	    prabu	    1	          2022-12-04

---#######################################################################
---Q5:Create insert queries to add around 4 to 8 rows in both the tables
---Query:-
INSERT INTO the_store_table(store_id, manager_staff_id, address_id,last_update) VALUES (2,2,2,"2022-12-04"),(3,3,3,"2022-12-04"), (4,4,4,"2022-12-04"), (5,5,5,"2022-12-04")

INSERT INTO the_staff_table(staff_id, first_name, last_name,address_id,last_update) VALUES (2, "thejaswi","cy",02,"2022-12-04"),(3, "rahul","bj",03,"2022-12-04"), (4, "shreyas","nayak",04,"2022-12-04"),(5, "ravi","bm",05,"2022-12-04")

CREATE INDEX store_id_index ON the_store_table (store_id);

CREATE TABLE the_staff_table (
    store_id int NOT NULL,
    manager_staff_id int NOT NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(store_id, manager_staff_id),
  	FOREIGN key (store_id) REFERENCES the_staff_table(store_id)
);

---#######################################################################
---Q6:Prepare a select query using WHERE, 'NOT IN', LIKE and ORDER BY clause
---Query:-
SELECT * from the_store_table  ORDER BY store_id DESC
---Output:-
---store_id	manager_staff_id	address_id	last_update
---5	      5	                5	          2022-12-04
---4	      4	                4	          2022-12-04
---3	      3	                3	          2022-12-04
---2	      2	                2	          2022-12-04
---1	      1	                1	          2022-12-04

---#######################################################################

---#######################################################################
---Q8:Prepare a INNER JOIN query between table1 and table2
---Query:-
SELECT the_staff_table.staff_id, the_store_table.store_id
FROM the_staff_table
INNER JOIN the_store_table ON the_staff_table.staff_id = the_store_table.store_id;
---Output:-
---staff_id	store_id
---1	      1
---2	      2
---3	      3
---4	      4
---5	      5
---#######################################################################


---#######################################################################
---Q9:Prepare LEFT JOIN query between table1 and table2
---Query:-
SELECT the_staff_table.staff_id, the_store_table.store_id
FROM the_staff_table
LEFT JOIN the_store_table ON the_staff_table.staff_id = the_store_table.store_id
ORDER BY the_staff_table.staff_id;
---Output:-
---staff_id	store_id
---1	      1
---2	      2
---3	      3
---4	      4
---5	      5
---#######################################################################
