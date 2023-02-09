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
1. row_id int pk
2. order_id varchar(10)
3. create_at datetime
4. item_name varchar(50)
5. item_category varchar(50)
6. item_price decimal(5,2)
7. quantity int
8. delivery boolean
9. utem_size varchar(20)
10. delivery_address_1 varchar(250)
11. delivery_address_2 varchar(250)
12. delivery_city varchar(50)
13. customer_firstname varchar(50)
14. customer_lastname varchar(50)
15. delivery_zipcode varchar(20)

# It's look like there is many redandency records right?

- Let's normalize order table

orders
-
- row_id int pk
- order_id varchar(10)
- create_at datetime
- quantity int
- cust_id int
- add_id int
- item_id varchar(20)

customers

- cust_id int pk FK >- orders.cust_id
- customer_firstname varchar(50)
- customer_lastname varchar(50)

address

- add_id int FK >- orders.add_id
- delivery_address_1 varchar(250)
- delivery_address_2 varchar(250)
- delivery_city varchar(50)
- delivery_zipcode varchar(20)
- delivery boolean

items
-
- item_id varchar(20) FK >- orders.item_id
- sku varchar(50)
- item_name varchar(100)
- item_category varchar(100)
- item_price decimal(5,2)
- item_size varchar(20)

# 2. Stock control tables

ingredients

- ing_id varchar(50) PK,
- ing_name varchar(100),
- ing_price decimal(5,2),
- ing_weight int,
- ing_measure varchar(20)

recipe

- row_id int PK,
- recipe_id varchar(20),
- ing_id varchar(50) FK >- ingredients.ing_id,
- quantity int

inventory

- inventory_id varchar(50),
- item_id varchar(50) FK >- ingredients.ing_id,
- quantity int

# 3. Staff tables

staff

- staff_id varchar(20) PK,
- firstname varchar(50),
- lastname varchar(50),
- horu_rate decimal(5,2),
- position varchar(50)

shift

- shift_id varchar(20) PK,
- start_time time,
- end_time time,
- day varchar(10)

working

- row_id int PK,
- staff_id varchar(50) FK >- staff.staff_id,
- shift_id varchar(50) FK >- shift.shift_id,
- working_date date,





