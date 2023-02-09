# Ben-s-Pizzeria
A tailor-made SQL database design for new Pizzeria outlet of Ben's in Switzerland

# Main 3 areas to focus:
1. Orders
2. Stock control
3. Staff

Let's design mockup for each tables.

# 1. Orders

orders
-
row_id int pk
order_id varchar(10)
create_at datetime
item_name varchar(50)
item_category varchar(50)
item_price decimal(5,2)
quantity int
delivery boolean
utem_size varchar(20)
delivery_address_1 varchar(250)
delivery_address_2 varchar(250)
delivery_city varchar(50)
customer_firstname varchar(50)
customer_lastname varchar(50)
delivery_zipcode varchar(20)


