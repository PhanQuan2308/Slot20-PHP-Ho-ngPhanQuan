-----------Manager Students----------------

-- Tạo hoặc chọn cơ sở dữ liệu fptaptechdb
CREATE DATABASE IF NOT EXISTS fptaptechdb;
USE fptaptechdb;

-- Tạo bảng Students
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(222),
    address VARCHAR(222)
);
select  * from Students



-- Tạo bảng subjects
CREATE TABLE subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(222) NOT NULL
);

-- Tạo bảng account
CREATE TABLE account (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30),
    password VARCHAR(30)
);




-- Tạo bảng marks với các ràng buộc khóa ngoại
CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    mark FLOAT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
select * from  marks
-- Chèn dữ liệu vào bảng subjects
INSERT INTO subjects (name) VALUES
('Math'),
('Physics'),
('Chemistry'),
('Biology'),
('History');

-- Chèn dữ liệu vào bảng marks
INSERT INTO marks (student_id, subject_id, mark) VALUES
(8, 1, 9.5),
(9, 2, 8),
(10, 1, 9.3),
(11, 3, 8.7),
(12, 2, 9.2);

select * from subjects;
select * from Students;
select * from marks;




--------------Shopping cart-------------
create database ShoppingCart;
use ShoppingCart;


create table SignUp(
	id INT auto_increment primary key,
	name varchar(222),
	username varchar(222),
	address varchar(222),
	pass varchar(222),
	cart_id INT
	
)


CREATE TABLE Carts (
    cart_id INT AUTO_INCREMENT PRIMARY KEY
);	

CREATE TABLE Customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(222),
  pass  varchar(222),
  cart_id INT,
   FOREIGN KEY (cart_id) REFERENCES Carts(cart_id)
);


CREATE TABLE Orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  date DATETIME,
  FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE Products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name_product VARCHAR(222),
  price DOUBLE,
  description VARCHAR(222),
  image VARCHAR(255)
);
select   * from Products
CREATE TABLE OrderDetails (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  price DOUBLE,
  quantity FLOAT,
  FOREIGN KEY (order_id) REFERENCES Orders(id),
  FOREIGN KEY (product_id) REFERENCES Products(id)
);


CREATE TABLE Invoices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  total_amount DOUBLE,
  FOREIGN KEY (order_id) REFERENCES Orders(id)
);
INSERT INTO Products (name_product, price, description, image)
VALUES
    ('SamSung', 500, 'Black', 'https://www.pexels.com/photo/black-iphone-7-on-brown-table-699122/'),
    ('Iphone', 1000, 'Blue', 'https://www.pexels.com/photo/a-nokia-3310-cellular-phone-19335258/'),
    ('Nokia', 100, 'Red', 'https://www.pexels.com/photo/black-samsung-android-smartphone-on-top-of-brown-wooden-tablke-214487/'),
    ('Huawei', 400, 'Green', 'https://www.pexels.com/photo/black-huawei-android-smartphone-1036619/');

select * from Products;

CREATE DATABASE IF NOT EXISTS employee_performance_db;
USE employee_performance_db;


CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS leave_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    year YEAR NOT NULL,
    days_off_taken INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS work_days (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    month INT NOT NULL,
    year YEAR NOT NULL,
    days_worked INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees (name) VALUES ('John Doe'), ('Jane Doe');

-- John Doe đã nghỉ 8 ngày trong năm 2021
INSERT INTO leave_days (employee_id, year, days_off_taken) VALUES (1, 2021, 8);
-- Jane Doe đã nghỉ 10 ngày trong năm 2021
INSERT INTO leave_days (employee_id, year, days_off_taken) VALUES (2, 2021, 10);

-- John Doe đã làm việc 220 ngày trong năm 2021
INSERT INTO work_days (employee_id, month, year, days_worked) VALUES (1, 1, 2021, 18), (1, 2, 2021, 20), ..., (1, 12, 2021, 19);
-- Jane Doe đã làm việc 230 ngày trong năm 2021
-- Jane Doe đã làm việc 230 ngày trong năm 2021
INSERT INTO work_days (employee_id, month, year, days_worked) 
VALUES 
    (2, 1, 2021, 20), 
    (2, 2, 2021, 22), 
    -- Tiếp tục chèn dữ liệu cho các tháng còn lại...
    (2, 12, 2021, 21);
