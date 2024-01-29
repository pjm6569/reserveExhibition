create database webp;
USE webp;

CREATE TABLE IF NOT EXISTS exhibition (
    id varchar(10) not null,
    name varchar(50) not null,
    photo varchar(30),
    place varchar(50),
    startDate DATE,
    endDate DATE,
	time INT,
    price INT,
    info varchar(400),
    category varchar(20),
    primary key(id)
);

	