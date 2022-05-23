-- 3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 --
select cus_gender,count(distinct customer.cus_id) as "Total no of customers based on gender"
from customer join orders
    on customer.cus_id = orders.cus_id
where orders.ord_amount >=3000
group by customer.cus_gender;

-- 4: Display all the orders along with product name ordered by a customer having Customer_Id=2 --
select ord_id as order_id, pro_name as product_name, pro_desc as product_description, ord_amount as order_date,ord_date as order_date
from orders join supplier_pricing on orders.pricing_id=supplier_pricing.pricing_id
            join product on product.pro_id=supplier_pricing.pro_id
where orders.cus_id=2;

-- 5: Display the Supplier details who can supply more than one product--
select supplier.supp_id, supplier.supp_name, supplier.supp_city, supplier.supp_phone
from supplier join supplier_pricing
                   on supplier.supp_id=supplier_pricing.supp_id
group by supplier.supp_id, supplier.supp_name, supplier.supp_city, supplier.supp_phone
having count(supplier_pricing.supp_id)>1;

-- 6: Find the least expensive product from each category and print the table with category id, name, product name and price of the product --
select category.cat_id, category.cat_name, product.pro_name, min(supplier_pricing.supp_price)
from category join product on category.cat_id=product.cat_id
              join supplier_pricing on supplier_pricing.pro_id=product.pro_id
group by category.cat_id, category.cat_name, product.pro_name;

-- 7: Display the Id and Name of the Product ordered after “2021-10-05” --
select ord_id, ord_amount,ord_date,pro_name, pro_desc
from orders join supplier_pricing on orders.pricing_id=supplier_pricing.pricing_id
            join product on product.pro_id=supplier_pricing.pro_id
where ord_date> '2021-10-05';

-- 8: Display customer name and gender whose names start or end with character 'A' --
select cus_name, cus_gender
from customer
where upper(cus_name) like 'A%' or upper(cus_name) like '%A';

-- 9: Create a stored procedure to display supplier id, name, rating and Type_of_Service. 
DELIMITER &&
create PROCEDURE showRating()
begin
    select reports.supp_id, reports.supp_name,reports.Average,
        case
            when reports.Average=5 then 'Excellent Service'
            when reports.Average>4 then 'Good Service'
            when reports.Average>2 then 'Average Service'
            else 'Poor Service'
        end as type_of_service
    from (select finals.supp_id, supplier.supp_name,finals.Average from
         (select test2.supp_id, avg(test2.rat_ratstars) as Average from
         (select supplier_pricing.supp_id, test1.ord_id, test1.rat_ratstars from supplier_pricing inner join
         (select orders.pricing_id, rating.ord_id, rating.rat_ratstars from orders inner join rating on rating.ord_id=orders.ord_id) as test1
         on test1.pricing_id=supplier_pricing.supp_id)
         as test2 group by supplier_pricing.supp_id)
         as finals inner join supplier where finals.supp_id=supplier.supp_id) as reports;
end && 
DELIMITER;

call showRating();