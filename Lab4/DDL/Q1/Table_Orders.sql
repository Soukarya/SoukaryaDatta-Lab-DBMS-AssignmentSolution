create table if not exists orders
(
	ORD_ID int primary key,
	ORD_AMOUNT int not null,
	ORD_DATE date not null,
	CUS_ID int,
	PRICING_ID int,
	foreign key(CUS_ID) references CUSTOMER(CUS_ID),
	foreign key(PRICING_ID) references SUPPLIER_PRICING(PRICING_ID)
);