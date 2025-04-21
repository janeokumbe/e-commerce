CREATE database Ecommerce_Db; 
USE Ecommerce_Db;

-- Table: brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: product_category
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: product
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2),
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Table: product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: color
CREATE TABLE color (
     color_id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(50) NOT NULL,
     hex_code VARCHAR(7)
 );

 -- Table: size_category
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Table: size_option
CREATE TABLE size_option (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    name VARCHAR(20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    color_id INT,
    size_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100),
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(type_id)
);

-- Brands
INSERT INTO brand (name, description)
VALUES 
('Nike', 'Sportswear and athletic shoes'),
('Apple', 'Consumer electronics and software');

-- Product Categories
INSERT INTO product_category (name, description)
VALUES 
('Clothing', 'Apparel and garments'),
('Electronics', 'Electronic gadgets and accessories');

-- Products
INSERT INTO product (name, brand_id, category_id, base_price, description)
VALUES 
('Air Max Sneakers', 1, 1, 120.00, 'Comfortable running shoes'),
('iPhone 14', 2, 2, 999.99, 'Latest Apple smartphone');

-- Product Images
INSERT INTO product_image (product_id, image_url)
VALUES 
(1, 'https://example.com/images/airmax.jpg'),
(2, 'https://example.com/images/iphone14.jpg');

-- Colors
INSERT INTO color (name, hex_code)
VALUES 
('Red', '#FF0000'),
('Black', '#000000');

-- Size Categories
INSERT INTO size_category (name)
VALUES 
('Clothing Sizes'),
('Phone Storage');

-- Size Options
INSERT INTO size_option (size_category_id, name)
VALUES 
(1, 'M'),
(1, 'L'),
(2, '128GB'),
(2, '256GB');

-- Product Variations
INSERT INTO product_variation (product_id)
VALUES 
(1),
(2);

-- Product Items
INSERT INTO product_item (variation_id, color_id, size_id, sku, price, stock_quantity)
VALUES 
(1, 1, 1, 'NK-AM-RED-M', 120.00, 10),
(1, 2, 2, 'NK-AM-BLK-L', 120.00, 5),
(2, 2, 3, 'APL-IP14-BLK-128', 999.99, 15),
(2, 2, 4, 'APL-IP14-BLK-256', 1099.99, 8);

-- Attribute Categories
INSERT INTO attribute_category (name)
VALUES 
('Physical'),
('Technical');

-- Attribute Types
INSERT INTO attribute_type (name)
VALUES 
('Text'),
('Number'),
('Boolean');

-- Product Attributes
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, name, value)
VALUES 
(1, 1, 1, 'Material', 'Mesh'),
(1, 1, 2, 'Weight', '0.8'),
(2, 2, 1, 'Processor', 'A15 Bionic'),
(2, 2, 2, 'Battery', '3200');
