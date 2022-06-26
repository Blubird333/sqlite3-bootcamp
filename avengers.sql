--Note: This file does not run like any other file(.py.cpp etc.)
-- This file is created for the info about sqlite3.

-- sudo apt-get install sqlite3
-- initiate sqlite3 shell by entering 'sqlite3 <file_name>.sqlite'


--Note: when 'references(affiliation.id)'(a foreign key) is used, affiliation table must be created before Characters table.
-- And foreign keys are disabled by default. To enable, use the command: 'PRAGMA foreign_keys = ON'
-- Inserting data
PRAGMA foreign_keys = ON;

-- When foreign key does it's work, this error will be displayed:'Error: stepping, FOREIGN KEY constraint failed (19)'


--Characters
--
--|    Name    | Gender |
--|------------+--------|
--| Tony Stark | M      |
--| Bruce      | M      |
--| Natasha    | F      |
--| Scott      | M      |
--| Wanda      | F      |

-- Creating table

create table Characters (
       id integer primary key,                                                  -- provides an id number for every row in the Characters table
       name text NOT NULL,                                                      -- Constraint set so that the name cannot be null
       gender varchar(1),                                                       -- varchar is similar to text but faster and with constraints
       superhero_name text,                                                     -- No Constraint
       affiliation_id integer references affiliation(id)                        -- used to associate Another table (affiliation)...'references(affiliation_id)',foreign key, is used to restricts the values that can be used for affiliation_id i.e, affiliation_id should not be other than those of id from affiliation table.
);
--Note: if "primary key" keyword is used, then the for entry of every row, there will an increment.(example is id in 'Characters' table)


insert into Characters(name,gender,affiliation_id,superhero_name) values ("Tony","M",1,"Ironman");
insert into Characters(name,gender,affiliation_id,superhero_name) values ("Bruce","M",2,"Hulk");
insert into Characters(name,gender,affiliation_id,superhero_name) values ("Natasha","F",3,"Black widow");
insert into Characters(name,gender,affiliation_id,superhero_name) values ("Scott","M",4,"Antman");
insert into Characters(name,gender,affiliation_id,superhero_name) values ("Wanda","F",5,"Scarlett Witch");

-- Getting data from tables

select name from Characters;                                                    -- returns all the names
select * from Characters;                                                       -- returns all the data
select * from Characters where superhero_name is NULL;                          -- returns all the Character data which has no superhero_name
select * from Characters where gender="M";                                      -- returns all the Character data which has gender "M"
select * from Characters where gender is "M";                                   -- returns all the Character data which has gender "M"

update Characters set superhero_name=NULL where id=3;                           -- for the Character with id=3 , change the superhero_name into null

----------------------------------------------------------------------------------------------------------------------------------------------------
-- Another table
create table affiliation(
       id integer primary key,
       job text not null,
       personality text not null
);

insert into affiliation(job,personality) values("scientist","funny");
insert into affiliation(job,personality) values("scientist","serious");
insert into affiliation(job,personality) values("assasin","serious");
insert into affiliation(job,personality) values("noob","funny");
insert into affiliation(job,personality) values("noob","serious");

----------------------------------------------------------------------------------------------------------------------------------------------------
--Now, the following command will print the given table:
select c.name,c.gender,c.superhero_name,a.job from Characters c,affiliation a where c.affiliation_id=a.id;

name     gender  superhero_name  job
-------  ------  --------------  ---------
Tony     M       Ironman         scientist
Bruce    M       Hulk            scientist
Natasha  F       Black widow     assasin
Scott    M       Antman          noob
Wanda    F       Scarlett Witch  noob
----------------------------------------------------------------------------------------------------------------------------------------------------
--Now, the following command will print the given table:
select c.name,c.gender,c.superhero_name,a.job from Characters c,affiliation a where c.affiliation_id=a.id and personality is "serious"; -- here, personality="serious" also returns the same.

name     gender  superhero_name  job
-------  ------  --------------  ---------
Bruce    M       Hulk            scientist
Natasha  F       Black widow     assasin
Wanda    F       Scarlett Witch  noob
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----   Modes t print the table data:
-- ascii
-- box
-- column
-- csv
-- html
-- Insert
-- json
-- line
-- list
-- markdown
-- quote
-- table
-- tables
-- tcl
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
