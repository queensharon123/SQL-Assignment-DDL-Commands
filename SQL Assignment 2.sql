## Creating Database Sales
create database Sales;
use Sales;
## Creating table Orders
create table Orders(
 Order_Id  varchar(566) Primary Key Unique,
 Customer_name varchar(50) not null,
 Product_Category varchar(40),
 Ordered_item varchar(40),
 Contact_No varchar(15)
);
desc Orders;
## Adding a new column Order quantity to the orders table
alter table Orders add order_quantity int;
desc Orders;
# Renaming table Orders to sales_orders
rename table Orders to sales_orders;
desc sales_orders;
# Adding values to the tables
insert into sales_orders (Order_Id,Customer_name,Product_Category,Ordered_item,Contact_No,order_quantity) values
 ('1248391','Rick Hansen','Technology','Konica Inkjet','890765342','28.3'),
 ('1343250','Vicky Freymann','Furniture','Sharp Wireless Fax','908765432','25.3'),
 ('1300145','Joel Eaton','Office Supplies','Samsung Smart Phone','908987542','26.3'), 
 ('1607676','Ellis Ballard','Technology','Iphone','9089890542','30.3'), 
 ('6359843','Harold Ryan','Furniture','Panasonic Printer','9847566456','56.3'), 
 ('0890795','Evan Minnotte','Technology','Hoover Stove','9847566456','45.3'),
 ('0850171','Keith Dawkins','Furniture','Breville Refrigerator','9847566456','23.3'),
 ('5464163','Rachel Payne','Technology','Enermax Router','98475908654','34.3'),
 ('8647734','Dave Brooks','Technology','Smead Lockers','9880906534','76.3'),
 ('6464183','Rachel Payne','Technology','Hamilton Beach Stove','98490867543','29.3')
 
 # Retrieve customer_name and Ordered_Item from the sales_orders table.
  Select Customer_name,Ordered_Item from sales_orders;
  select * from sales_orders;
  
  # updating the name of the product 
  update sales_orders
  set Product_Category = 'Furniture'
  where Order_Id = '8647734';
  
  select * from sales_orders;
  
  #Delete all the rows from sales_order table
  SET SQL_SAFE_UPDATES = 0;
  select * from sales_orders;
  
  delete from sales_orders;
  select * from sales_orders;
  
  #Delete the sales_orders table from the database.
  drop table sales_orders;
  
 
  
  
  
  
  