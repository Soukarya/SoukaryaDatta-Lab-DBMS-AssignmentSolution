create table if not exists supplier
(
	SUPP_ID int primary key,
	SUPP_NAME varchar(50) not null,
	SUPP_CITY varchar(50) not null,
	SUPP_PHONE varchar(50) not null
);