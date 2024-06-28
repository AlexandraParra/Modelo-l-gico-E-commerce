-- Criação das tabelas

CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    identification VARCHAR(50),
    address VARCHAR(150),
    id_Business_Account int,
    id_Personal_Account int,
    constrain fk_customer_business_account FOREIGN KEY (id_Business_Account) REFERENCES Business_Account(id),
    constrain fk_customer_personal_account FOREIGN KEY (id_Personal_Account) REFERENCES Personal_Account(id)
);

CREATE TABLE Business_Account (
    id INT PRIMARY KEY
);

CREATE TABLE Personal_Account (
    id INT PRIMARY KEY
);

CREATE TABLE Product (
    id INT PRIMARY KEY,
    category VARCHAR(50),
    description VARCHAR(150),
    price FLOAT
);

CREATE TABLE Seller (
    id INT PRIMARY KEY,
    company_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Supplier (
    id INT PRIMARY KEY,
    company_name VARCHAR(100),
    tax_id VARCHAR(18)
);

CREATE TABLE Storage_Location (
    id INT PRIMARY KEY,
    location VARCHAR(100)
);

CREATE TABLE Order (
    id INT PRIMARY KEY,
    status VARCHAR(50),
    description VARCHAR(150),
    shipping_fee FLOAT,
    customer_id INT,
    payment_id INT,
    constrain fk_order_customer FOREIGN KEY (customer_id) REFERENCES Customer(id),
    constrain fk_order_payment FOREIGN KEY (payment_id) REFERENCES Payment(id)
);

CREATE TABLE Payment (
    id INT PRIMARY KEY,
    date DATE
);

CREATE TABLE Payment_Method (
    id INT PRIMARY KEY,
    payment_id INT,
    credit_card_id INT,
    bank_slip_id INT,
    deposit_id INT,
    constrain fk_payment_method_payment FOREIGN KEY (payment_id) REFERENCES Payment(id),
    constrain fk_payment_credit_card FOREIGN KEY (credit_card_id) REFERENCES Credit_Card(id),
    constrain fk_payment_bank_slip FOREIGN KEY (bank_slip_id) REFERENCES Bank_Slip(id),
    constrain fk_payment_deposit FOREIGN KEY (deposit_id) REFERENCES Deposit(id)
);

CREATE TABLE Credit_Card (
    id INT PRIMARY KEY,
    number VARCHAR(20),
    expiration_date DATE
);

CREATE TABLE Bank_Slip (
    id INT PRIMARY KEY,
    number VARCHAR(20)
);

CREATE TABLE Deposit (
    id INT PRIMARY KEY,
    number VARCHAR(20),
    issue_date DATE
);

CREATE TABLE Delivery (
    id INT PRIMARY KEY,
    status VARCHAR(50),
    tracking_code VARCHAR(50),
    order_id INT,
    constrain fk_delivery_order FOREIGN KEY (order_id) REFERENCES Order(id)
);

CREATE TABLE Relation_Seller_Product (
    seller_id INT,
    product_id INT,
    PRIMARY KEY (seller_id, product_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Relation_Supplier_Product (
    supplier_id INT,
    product_id INT,
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

CREATE TABLE Relation_Product_Storage_Location (
    product_id INT,
    storage_id INT,
    PRIMARY KEY (product_id, storage_id),
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (storage_id) REFERENCES Storage_Location(id)
);

CREATE TABLE Relation_Product_Order (
    product_id INT,
    order_id INT,
    PRIMARY KEY (product_id, order_id),
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (order_id) REFERENCES Order(id)
);

-- Inserção de dados nas tabelas

INSERT INTO Business_Account (id) VALUES
(1), (2), (3);

INSERT INTO Personal_Account (id) VALUES
(1), (2), (3);

INSERT INTO Customer (id, name, identification, address, id_Business_Account, id_Personal_Account) VALUES
(1, 'Alice Souza', '12345678901', '123 A Street', 1, NULL),
(2, 'Bruno Oliveira', '98765432100', '456 B Street', NULL, 2),
(3, 'Carla Lima', '19283746509', '789 C Street', NULL, 3);

INSERT INTO Product (id, category, description, price) VALUES
(1, 'Electronics', 'Smartphone', 1999.99),
(2, 'Home Appliance', 'Refrigerator', 2999.99),
(3, 'Furniture', 'Sofa', 999.99);

INSERT INTO Seller (id, company_name, location) VALUES
(1, 'Sales Ltd', 'São Paulo'),
(2, 'XYZ Market', 'Rio de Janeiro'),
(3, 'ABC Commerce', 'Belo Horizonte');

INSERT INTO Supplier (id, company_name, tax_id) VALUES
(1, 'Supplier A', '11122233300014'),
(2, 'Supplier B', '44455566600018'),
(3, 'Supplier C', '77788899900010');

INSERT INTO Storage_Location (id, location) VALUES
(1, 'Warehouse 1'),
(2, 'Warehouse 2'),
(3, 'Warehouse 3');

INSERT INTO Payment (id, date) VALUES
(1, '2024-06-01'),
(2, '2024-06-15'),
(3, '2024-06-25');

INSERT INTO Credit_Card (id, number, expiration_date) VALUES
(1, '1234567812345678', '2025-12-31'),
(2, '2345678923456789', '2026-11-30'),
(3, '3456789034567890', '2027-10-29');

INSERT INTO Bank_Slip (id, number) VALUES
(1, '00123456789'),
(2, '00234567890'),
(3, '00345678901');

INSERT INTO Deposit (id, number, issue_date) VALUES
(1, '123456789', '2024-06-01'),
(2, '234567890', '2024-06-15'),
(3, '345678901', '2024-06-25');

INSERT INTO Payment_Method (id, payment_id, credit_card_id, bank_slip_id, deposit_id) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, NULL, 2, NULL),
(3, 3, NULL, NULL, 3);

INSERT INTO Order (id, status, description, shipping_fee, customer_id, payment_id) VALUES
(1, 'Pending', 'Order for Smartphone', 30.00, 1, 1),
(2, 'Shipped', 'Order for Refrigerator', 50.00, 2, 2),
(3, 'Delivered', 'Order for Sofa', 70.00, 3, 3);

INSERT INTO Delivery (id, status, tracking_code, order_id) VALUES
(1, 'In transit', 'R123456789BR', 1),
(2, 'Delivered', 'S234567890BR', 2),
(3, 'Pending', 'T345678901BR', 3);

INSERT INTO Relation_Seller_Product (seller_id, product_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Relation_Supplier_Product (supplier_id, product_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Relation_Product_Storage_Location (product_id, storage_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Relation_Product_Order (product_id, order_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Queries
-- Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.name AS customer_name,
    COUNT(o.id) AS order_count
FROM 
    Customer c
LEFT JOIN 
    "Order" o ON c.id = o.customer_id
GROUP BY 
    c.name;


-- Algum vendedor também é fornecedor?
SELECT 
    s.id AS seller_id,
    s.company_name AS seller_company_name,
    sp.id AS supplier_id,
    sp.company_name AS supplier_company_name
FROM 
    Seller s
INNER JOIN 
    Supplier sp ON s.company_name = sp.company_name;


-- Relação de produtos fornecedores e estoques;
SELECT 
    p.id AS product_id,
    p.category AS product_category,
    p.description AS product_description,
    sp.id AS supplier_id,
    sp.company_name AS supplier_company_name,
    sl.id AS storage_id,
    sl.location AS storage_location
FROM 
    Product p
INNER JOIN 
    Relation_Supplier_Product rsp ON p.id = rsp.product_id
INNER JOIN 
    Supplier sp ON rsp.supplier_id = sp.id
INNER JOIN 
    Relation_Product_Storage_Location rpsl ON p.id = rpsl.product_id
INNER JOIN 
    Storage_Location sl ON rpsl.storage_id = sl.id
ORDER BY 
    p.id;


-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT 
    sp.company_name AS supplier_name,
    p.description AS product_name
FROM 
    Supplier sp
INNER JOIN 
    Relation_Supplier_Product rsp ON sp.id = rsp.supplier_id
INNER JOIN 
    Product p ON rsp.product_id = p.id
ORDER BY 
    sp.company_name, p.description;