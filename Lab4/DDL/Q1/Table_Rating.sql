create table rating
(
    RAT_ID int primary key,
    ORD_ID int,
    RAT_RATSTARS int not null,
    foreign key(ORD_ID) references ORDERS(ORD_ID)
);