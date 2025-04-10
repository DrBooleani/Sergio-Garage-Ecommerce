CREATE TABLE tb_user (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    photo_url VARCHAR(255)
);

CREATE TABLE tb_role (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(100)
);

CREATE TABLE tb_user_role (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES tb_role(id) ON DELETE CASCADE
);

CREATE TABLE tb_company_config (
    config_id SERIAL PRIMARY KEY,
    corporate_name VARCHAR(255) NOT NULL,
    trade_name VARCHAR(255),
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    state_registration VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(200),
    logo_url VARCHAR(255)
);

CREATE TABLE tb_address (
    address_id SERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(20),
    complement VARCHAR(100),
    neighborhood VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100)
);

CREATE TABLE tb_company_address (
    company_config_id INT NOT NULL,
    address_id INT NOT NULL,
    type VARCHAR(50),
    PRIMARY KEY (company_config_id, address_id),
    FOREIGN KEY (company_config_id) REFERENCES tb_company_config(config_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES tb_address(address_id) ON DELETE CASCADE
);

CREATE TABLE tb_product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL,
    ncm VARCHAR(10),
    unit VARCHAR(10)
);

CREATE TABLE tb_cart (
    cart_id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE
);

CREATE TABLE tb_cart_item (
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES tb_cart(cart_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tb_product(product_id) ON DELETE CASCADE
);

CREATE TABLE tb_order (
    order_id SERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    address_id INT NOT NULL,
    total_amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    issued_at TIMESTAMP,
    nfe_number VARCHAR(50),
    nfe_key VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES tb_user(id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES tb_address(address_id) ON DELETE CASCADE
);

CREATE TABLE tb_order_item (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES tb_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tb_product(product_id) ON DELETE CASCADE
);
