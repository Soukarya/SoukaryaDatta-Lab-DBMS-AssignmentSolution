create table if not exists product
(
    PRO_ID int primary key,
    PRO_NAME varchar(20) DEFAULT 'Dummy' not null,
    PRO_DESC varchar(60),
    CAT_ID int,
    foreign key (CAT_ID) references CATEGORY(CAT_ID)
);