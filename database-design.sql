

CREATE TABLE `customers`(
    `cust_id` int  NOT NULL ,
    `customer_firstname` varchar(50)  NOT NULL ,
    `customer_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

CREATE TABLE `address`(
    `add_id` int  NOT NULL ,
    `delivery_address_1` varchar(250)  NOT NULL ,
    `delivery_address_2` varchar(250)  NOT NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL
    
);

CREATE TABLE `items`(
    `item_id` varchar(20)  NOT NULL PRIMARY KEY,
    `sku` varchar(50)  NOT NULL ,
    `item_name` varchar(100)  NOT NULL ,
    `item_category` varchar(100)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    `item_size` varchar(20)  NOT NULL 
);

CREATE TABLE `orders`(
    `row_id` int NOT NULL,
    `order_id` varchar(10) NOT NULL,
    `create_at` date NOT NULL ,
    `quantity` int NOT NULL,
    `cust_id` int NOT NULL,
    `add_id` int NOT NULL,
    `item_id` varchar(20) NOT NULL ,
    `delivery` boolean  NOT NULL,
    FOREIGN KEY(item_id) REFERENCES items(item_id),
    FOREIGN KEY(add_id) REFERENCES address(add_id),
    FOREIGN KEY(cust_id) REFERENCES customers(cust_id),
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `staff`(
    `staff_id` varchar(20)  NOT NULL PRIMARY KEY,
    `firstname` varchar(50)  NOT NULL ,
    `lastname` varchar(50)  NOT NULL ,
    `hour_rate` decimal(5,2)  NOT NULL ,
    `position` varchar(50)  NOT NULL 
);

CREATE TABLE `shift`(
    `shift_id` varchar(20)  NOT NULL PRIMARY KEY,
    `start` time  NOT NULL ,
    `end` time  NOT NULL ,
    `day` varchar(20)  NOT NULL 
);

CREATE TABLE `working`(
    `row_id` int  NOT NULL ,
    `rota_id` varchar(20)  NOT NULL ,
    `staff_id` varchar(20)  NOT NULL ,
    `shift_id` varchar(20)  NOT NULL ,
    `working_date` date  NOT NULL,
    PRIMARY KEY (
        `row_id`
    ),
    FOREIGN KEY(staff_id) REFERENCES staff('staff_id'),
FOREIGN KEY(shift_id) REFERENCES shift('shift_id')
);

CREATE TABLE `ingredients` (
    `ing_id` varchar(20)  NOT NULL ,
    `ing_name` varchar(100)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_measure` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `inventory` (
    `inventory_id` varchar(50)  NOT NULL PRIMARY KEY,
    `item_id` varchar(500) NOT NULL,
    `quantity` int  NOT NULL,
    FOREIGN KEY(item_id) REFERENCES ingredients(ing_id) 
);

CREATE TABLE `recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(50) NOT NULL,
    `ing_id` varchar(20) NOT NULL,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    ),
    FOREIGN KEY(recipe_id) REFERENCES items(sku),
    FOREIGN KEY(ing_id) REFERENCES ingredients(ing_id)
);

