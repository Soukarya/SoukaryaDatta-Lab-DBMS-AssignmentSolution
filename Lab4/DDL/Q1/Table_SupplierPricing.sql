create table if not exists supplier_pricing
(
    PRICING_ID int primary key,
    PRO_ID int,
    SUPP_ID int,
    SUPP_PRICE int default 0,
    foreign key(PRO_ID) references PRODUCT(PRO_ID),
    foreign key(SUPP_ID) references SUPPLIER(SUPP_ID)
);