CREATE DATABASE IF NOT EXISTS restaurant;
USE restaurant;
-- create roles----------------
CREATE TABLE roles (
    id INT AUTO_INCREMENT,
    role_type VARCHAR(30) NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    PRIMARY KEY (id)
);
-- create users--------------------
CREATE TABLE users (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email VARCHAR(30),
    user_role INT,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (user_role)
        REFERENCES roles (id)
);
-- create tables--------------------
CREATE TABLE restaurant_tables (
    id INT NOT NULL AUTO_INCREMENT,
    capacity INT NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create ProductCategories
CREATE TABLE product_categories (
    id INT AUTO_INCREMENT,
    product_category_name VARCHAR(30) NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create ProductTypes
CREATE TABLE category_types (
    id INT AUTO_INCREMENT,
    main_category INT,
    category_type_name VARCHAR(30) NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (main_category)
	REFERENCES product_categories (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create products
CREATE TABLE products (
    id INT AUTO_INCREMENT,
    product_name VARCHAR(40) NOT NULL,
    category INT,
    product_type INT,
    image_path BLOB,
    price DECIMAL NOT NULL,
    CHECK (price > 0),
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (category)
        REFERENCES product_categories (id),
    FOREIGN KEY (product_type)
        REFERENCES category_types (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create statusCodes
CREATE TABLE order_statuses (
    id INT AUTO_INCREMENT,
    status_name VARCHAR(15) NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    waiter INT,
    order_table INT,
    order_status INT,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    end_date DATETIME,
    created_by INT,
    updated_by INT,
    PRIMARY KEY (id),
    FOREIGN KEY (waiter)
		REFERENCES users (id),
    FOREIGN KEY (order_table)
        REFERENCES restaurant_tables (id),
    FOREIGN KEY (order_status)
        REFERENCES order_statuses (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id)
);
-- create ordersProducts
CREATE TABLE orders_products (
    order_id INT,
    product_id INT,
    product_price DECIMAL,
    product_quantity INT NOT NULL,
    is_deleted BIT NOT NULL DEFAULT 0,
    create_date DATETIME,
    update_date DATETIME,
    created_by INT,
    updated_by INT,
    FOREIGN KEY (order_id)
        REFERENCES orders (id),
    FOREIGN KEY (product_id)
        REFERENCES products (id),
    FOREIGN KEY (created_by)
        REFERENCES users (id),
    FOREIGN KEY (updated_by)
        REFERENCES users (id),
    CONSTRAINT orders_products_pk PRIMARY KEY (order_id , product_id)
);
