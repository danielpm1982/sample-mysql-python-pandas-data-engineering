/*run this schema.sql file at a MySQL server (running at your OS or at a Docker container) to create a compatible DB schema, in order to populate it later with the data that will be integrated from different data sources, through the python .ipynb script (main.ipynb), available at this same project root path. You must have already created the DB, with the name SAMPLE_MYSQL_PYTHON_PANDAS_DATA_ENGINEERING_DB (or other name, as long as you change it below as well), and also a user, with all priviledges for managing this DB tables - both through DDL as DML SQL statements. Other sql files will be generated from the main.ipynb execution, in order to populate this DB schema with the right data already integrated and sanitized with Pandas - from inside the .ipynb script. Initially, the execution of these .sql files should be done manually (through MySQL Workbench, for instance)... later, at another part of the ipynb file, Connector/python will be used to automate this population process - the idea here is to show both ways, step by step. This particular schema.sql is for creating an initially empty compatible schema.*/

use SAMPLE_MYSQL_PYTHON_PANDAS_DATA_ENGINEERING_DB;
create table AUTHOR(
	ID int primary key auto_increment,
	NAME varchar(200)
);

create table GENRE (
	ID int primary key auto_increment,
	NAME varchar(200)
);

create table BOOK (
	ID int primary key auto_increment,
	NAME varchar(200),
    LANGUAGE varchar(100),
    FIRST_PUBLISHED int,
    SALES decimal(10,2),
    AUTHOR_ID int,
    GENRE_ID int,
    foreign key (AUTHOR_ID) references AUTHOR(ID),
    foreign key (GENRE_ID) references GENRE(ID)
);

create table FEEDBACK_PT_BR (
    ID int primary key auto_increment,
    LIVRO_ID int,
    NOME_CLIENTE varchar(100),
    SOBRENOME_CLIENTE varchar(100),
    FEEDBACK text,
    foreign key (LIVRO_ID) references BOOK(ID)
);
