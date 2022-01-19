## Tạo bảng nhân viên

CREATE TABLE employee(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    date_of_birth DATE NOT NULL,  
    gender ENUM ('Male', 'Female')  
    address TEXT NOT NULL,  
    mobile VARCHAR(11) NOT NULL,  
    email TEXT NOT NULL,  
    position TEXT NOT NULL
)

***

## Tạo bảng ca làm việc

CREATE TABLE shift(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    shift_type ENUM('Morning', 'Afternoon', 'Night',  'Full-time'),  
    start TIME NOT NULL,  
    end TIME NOT NULL,   
    month DATE NOT NULL,  
    salary_per_day BIGINT NOT NULL
)

***

## Tạo bảng lương thưởng

CREATE TABLE bonus(  
    id INT PRIMARY KEY AUTO_INCREMENT,    
    name TEXT NOT NULL,  
    bonus_money BIGINT NOT NULL
)

***

## Tạo bảng lương phạt

CREATE TABLE punish(  
id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    punish_money BIGINT NOT NULL
)

***

## Tạo bảng nhân viên_lương thưởng

CREATE TABLE employee_bonus(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    id_bonus INT,  
    bonus_number INT,  
    bonus_date TEXT,  
    total_bonus_money BIGINT,  
    FOREIGN KEY (id_bonus) REFERENCES bonus(id),  
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)

***

## Tạo bảng nhân viên_lương phạt

CREATE TABLE employee_punish(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    id_punish INT,  
    punish_number INT,  
    punish_date TEXT,  
    total_punish_money BIGINT,  
    FOREIGN KEY (id_punish) REFERENCES punish(id),  
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)

***

## Tạo bảng lương cơ bản

CREATE TABLE salary(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    id_shift INT NOT NULL,  
    shift_number INT NOT NULL,  
    salary_per_month BIGINT NOT NULL,  
    FOREIGN KEY (id_employee) REFERENCES employee(id),  
    FOREIGN KEY (id_shift) REFERENCES shift(id)
)

***

## Tạo bảng tổng lương tháng

CREATE TABLE full_salary(  
    id_salary INT NOT NULL,        
    id_employee_bonus INT NOT NULL,  
    id_employee_punish INT NOT NULL,  
    month DATE NOT NULL,  
    total_salary BIGINT NOT NULL,  
    FOREIGN KEY (id_salary) REFERENCES salary(id),  
    FOREIGN KEY (id_employee_punish) REFERENCES employee_punish(id),  
    FOREIGN KEY (id_employee_bonus) REFERENCES employee_bonus(id)
)

***    

## Tạo bảng khách hàng

CREATE TABLE customer(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    date_of_birth DATE NOT NULL,  
    gender ENUM ('Male', 'Female'),  
    address TEXT NOT NULL,  
    mobile VARCHAR(11) NOT NULL,  
    email TEXT NOT NULL
)

***

## Tạo bảng nhà sản xuất

CREATE TABLE producer(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    address TEXT NOT NULL
)

***

## Tạo bảng diễn viên

CREATE TABLE actor(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    first_name TEXT NOT NULL,  
    last_name TEXT NOT NULL
)

***

## Tạo bảng thể loại

CREATE TABLE category(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL
)

***

## Tạo bảng format

CREATE TABLE format(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    format TEXT NOT NULL)

***

## Tạo bảng phim

CREATE TABLE film(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_producer INT NOT NULL,  
    title TEXT NOT NULL,  
    director TEXT NOT NULL,  
    poster TEXT NOT NULL,  
    description TEXT NOT NULL,  
    length INT NOT NULL,  
    rating ENUM('PG','G','PG-13','R','NC-17'),  
    status ENUM('Release','Coming Soon'),  
    FOREIGN KEY (id_producer) REFERENCES producer(id)
)

***

## Tạo bảng trailer

CREATE TABLE trailer(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_film INT NOT NULL,  
    video_trailer TEXT NOT NULL,  
    FOREIGN KEY (id_film) REFERENCES film(id)
)

---

## Tạo bảng phim_format

CREATE TABLE film_format(  
    id_film INT NOT NULL,  
    FOREIGN KEY (id_film) REFERENCES film(id),  
    id_format INT NOT NULL,  
    FOREIGN KEY (id_format) REFERENCES format(id),  
    PRIMARY KEY (id_film, id_format))

***

## Tạo bảng phim_thể loại

CREATE TABLE  film_category(  
    id_film INT NOT NULL,  
    id_category INT NOT NULL,  
    FOREIGN KEY (id_film) REFERENCES film(id),  
    FOREIGN KEY (id_category) REFERENCES category(id),  
    PRIMARY KEY(id_film, id_category)
)

---

## Tạo bảng phim_diễn viên

CREATE TABLE  film_actor(  
    id_film INT NOT NULL,  
    id_actor INT NOT NULL,  
    FOREIGN KEY (id_film) REFERENCES film(id),  
    FOREIGN KEY (id_actor) REFERENCES actor(id),  
    PRIMARY KEY(id_film, id_actor)
)

---

## Tạo bảng phòng chiếu

CREATE TABLE room(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL
)

***

## Tạo bảng vị trí ghế

CREATE TABLE seat(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_room INT NOT NULL,  
    seat_number INT NOT NULL,  
    seat_row TEXT NOT NULL,  
    status ENUM('Empty','Served'),  
    FOREIGN KEY (id_room) REFERENCES room(id)
)

***

## Tạo bảng loại vé

CREATE TABLE ticket_type(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    price BIGINT NOT NULL
)

***

## Tạo bảng discount

CREATE TABLE discount (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    discount FLOAT 
)

***

## Tạo bảng vé

CREATE TABLE ticket (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    id_customer INT NOT NULL,  
    id_film INT NOT NULL,  
    id_room INT NOT NULL,  
    id_seat INT NOT NULL,  
    cinema_address TEXT NOT NULL,  
    time_start TIME NOT NULL,  
    FOREIGN KEY (id_employee) REFERENCES employee(id),  
    FOREIGN KEY (id_customer) REFERENCES customer(id),  
    FOREIGN KEY (id_film) REFERENCES film(id),  
    FOREIGN KEY (id_room) REFERENCES room(id),  
    FOREIGN KEY (id_seat) REFERENCES seat(id)
)

***

## Tạo bảng hóa đơn khách hàng

CREATE TABLE ticket_bill (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    date_bill DATE NOT NULL,  
    time_bill TIME NOT NULL,  
    id_ticket INT NOT NULL,  
    id_ticket_type INT NOT NULL,  
    id_discount INT NOT NULL,  
    FOREIGN KEY (id_ticket) REFERENCES ticket(id),  
    FOREIGN KEY (id_ticket_type) REFERENCES ticket_type(id),  
    FOREIGN KEY (id_discount) REFERENCES discount(id),  
    numer_of_tickets INT NOT NULL,   
    total_bill BIGINT NOT NULL
)

***


## Tạo bảng nhà cung cấp nguyên liệu

CREATE TABLE supplier(    
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    address TEXT NOT NULL,  
    mobile VARCHAR(11) NOT NULL,  
    bank_account_number INT NOT NULL
)

***

## Tạo bảng phiếu nhập

CREATE TABLE import_ticket(  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    id_supplier INT NOT NULL,  
    import_date DATE NOT NULL,  
    imported_money BIGINT NOT NULL,  
    FOREIGN KEY (id_employee) REFERENCES employee(id),  
    FOREIGN KEY (id_supplier) REFERENCES supplier(id)
)

***

## Tạo bảng hàng nhập
 
CREATE TABLE import_goods(    
    id INT PRIMARY KEY AUTO_INCREMENT,  
    name TEXT NOT NULL,  
    production_date DATE NOT NULL,  
    expiration_date DATE
)

***

## Tạo bảng chi tiết phiếu nhập

CREATE TABLE detail_import_ticket(  
    id_import_ticket INT NOT NULL,  
    id_import_goods INT NOT NULL,  
    quantity_of_goods INT NOT NULL,  
    money_per_goods BIGINT NOT NULL,  
    FOREIGN KEY (id_import_ticket) REFERENCES import_ticket(id),  
    FOREIGN KEY (id_import_goods) REFERENCES import_goods(id)
)

***

## Tạo bảng menu

CREATE TABLE menu (  
    id INT PRIMARY KEY,  
    name TEXT NOT NULL,  
    type ENUM('Drink','Popcorn','Snacks'),  
    price BIGINT NOT NULL
)

***

## Tạo bảng hóa đơn ăn uống
 
CREATE TABLE bill (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_employee INT NOT NULL,  
    bill_date DATE NOT NULL,  
    discount FLOAT NOT NULL,  
    bill_money BIGINT NOT NULL,  
    FOREIGN KEY (id_employee) REFERENCES employee(id)
)

***

## Tạo bảng chi tiết hóa đơn ăn uống

CREATE TABLE detail_bill (  
    id INT PRIMARY KEY AUTO_INCREMENT,  
    id_bill INT NOT NULL,  
    id_menu INT NOT NULL,  
    number_of_menu INT NOT NULL,  
    FOREIGN KEY (id_bill) REFERENCES bill(id),  
    FOREIGN KEY (id_menu) REFERENCES menu(id)
)

***        
  
---      

***

## Thêm dữ liệu nhân viên

insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values  (1,'Tùng','2001-01-01','Male','Hà Nội',0123431536,'tung@gmail.com','Quản lí');  
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (2,'Hải','1999-02-02','Male','Hà Nội',01234534325,'hai@gmail.com','Soát vé');  
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (3,'VIệt','2002-03-03','Male','Hà Nội',0942214355,'viet@gmail.com','Bảo vệ');  
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (4,'My','2000-04-04','Female','Hà Nội',0943251341,'my@gmail.com','Soát Vé');  
insert into employee (id, name, date_of_birth, gender, address, mobile, email, position) values (5,'Hương','2000-05-05','Female','Hà Nội',01222567899,'huong@gmail.com','Bán hàng');

---

## Thêm dữ liệu ca làm việc

insert into shift (id, shift_type, start, end, month, salary_per_day) values (1, 'Morning', '8:00 AM', '13:00 AM', '1', 100000);  
insert into shift (id, shift_type, start, end, month, salary_per_day) values (2, 'Afternoon', '13:00 AM', '17:00 AM', '1', 100000);  
insert into shift (id, shift_type, start, end, month, salary_per_day) values (3, 'Night', '17:00 AM', '22:00 AM', '1', 120000);  
insert into shift (id, shift_type, start, end, month, salary_per_day) values (4, 'Full-time', '8:00 AM', '5:00 AM', '1', 150000);

---

## Thêm dữ liệu lương thưởng

insert into bonus (id, name, bonus_money) values(1, 'Tăng ca', 70000);  
insert into bonus (id, name, bonus_money) values(2, 'Nhân viên xuất sắc nhất tháng', 500000 );  
insert into bonus (id, name, bonus_money) values(3, 'Làm ngày lễ', 100000);

---

## Thêm dữ liệu phạt

insert into punish (id, name, punish_money) values(1, 'Đi làm muộn', 50000);  
insert into punish (id, name, punish_money) values(2, 'Nghỉ làm không có lý do', 70000);  
insert into punish (id, name, punish_money) values(3, 'Làm hỏng thiết bị quầy vé', 3000000);  
insert into punish (id, name, punish_money) values(4, 'Làm hỏng thiết bị quầy nước', 5000000);  
insert into punish (id, name, punish_money) values(5, 'Dọn dẹp chuẩn bị suất chiếu chậm', 100000);

---

## Thêm dữ liệu nhân viên_thưởng

insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(1, 1, 1, 3,'2000-01-05, 2000-01-07, 2000-01-10', 210000);  
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(2, 2, 1, 2,'2000-01-11, 2000-01-15', 140000);  
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(3, 3, 2, 1, '2021-01-01', 500000);  
insert into employee_bonus(id, id_employee, id_bonus, bonus_number, bonus_date, total_bonus_money) values(4, 4, 3, 1,'2000-01-01', 100000);

---

## Thêm dữ liệu khách hàng

insert into customer (id,name, date_of_birth, gender, address, mobile, email) values (1, 'Colver Halksworth', '2001/11/04', 'Male', '2034 Scoville Pass', '2761142330', 'chalksworth0@domainmarket.com');  
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (2, 'Carmelina Vaen', '2000/08/03', 'Male', '77 Birchwood Circle', '7221399921', 'cvaen1@theguardian.com');  
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (3, 'Hieronymus Bisgrove', '1998/08/30', 'Male', '9673 Lillian Crossing', '4526552127', 'hbisgrove2@jalbum.net');  
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (4, 'Glenn Meadowcraft', '1996/09/01', 'Female', '66 La Follette Drive', '8985430963', 'gmeadowcraft3@java.com');  
insert into customer (id, name, date_of_birth, gender, address, mobile, email) values (5, 'Beverly Kellington', '1998/06/18', 'Male', '589 Pond Road', '1696852013', 'bkellington4@google.com');

---

## Thêm dữ liệu nhà sản xuất

insert into producer (id, name, address) values (1, 'Youbridge', 'Okuta');    
insert into producer (id, name, address) values (2, 'Lazzy', 'Kupusina');  
insert into producer (id, name, address) values (3, 'Skivee', 'Phra Phutthabat');  
insert into producer (id, name, address) values (4, 'Quinu', 'Pujocucho');  
insert into producer (id, name, address) values (5, 'Bluejam', 'Gubu');

---

## Thêm dữ liệu diễn viên

insert into actor (id, first_name, last_name) values (1, 'Bernetta', 'Tal');  
insert into actor (id, first_name, last_name) values (2, 'Whitby', 'Sainsbury-Brown');  
insert into actor (id, first_name, last_name) values (3, 'Novelia', 'Toor');  
insert into actor (id, first_name, last_name) values (4, 'Marjorie', 'Sallings');  
insert into actor (id, first_name, last_name) values (5, 'Malorie', 'Serrier');

---

## Thêm dữ liệu thể loại phim

insert into category (id, name) values (1, 'Romance');   
insert into category (id, name) values (2, 'Comedy');  
insert into category (id, name) values (3, 'Drama');  
insert into category (id, name) values (4, 'Musical');  
insert into category (id, name) values (5, 'Documentary');

---

## Thêm dữ liệu bảng phim

insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (1, 1, 'Snow White and the Huntsman', 'Dick Rosiello', '', '', 235, 'PG', 'Release');  
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (2, 2, 'Doctor at Sea', 'Katherine Tindle', '', '', 138,'G', 'Release');  
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (3, 3, 'Great Day in the Morning', 'Sheela Whittlesea', '', '', 137, 3, 'Coming Soon');  
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (4, 4, 'My Summer of Love', 'Orelle Arrundale', '', '', 263, 'G', 'Release');  
insert into film (id, id_producer, title, director, poster, desciption, length, rating, status) values (5, 'R', 'Deal, The', 'Dina Cossem', '', '', 263, 'NC-17', 'Coming Soon');

---

## Thêm dữ liệu bảng format

insert into format (id, name) values (1, '2D');  
insert into format (id, name) values (2, '3D');  
insert into format (id, name) values (3, 'IMAX');  
insert into format (id, name) values (4, '4DX');  
insert into format (id, name) values (5, 'Starium Laser');

---

## Thêm dữ liệu bảng phòng chiếu

insert into room (id, name) values (1, 'Phong 1');  
insert into room (id, name) values (2, 'Phong 2');  
insert into room (id, name) values (3, 'Phong 3');  
insert into room (id, name) values (4, 'Phong 4');  
insert into room (id, name) values (5, 'Phong 5'); 

---

## Thêm dữ liệu bảng vị trí ghế ngồi

insert into seat (id, id_room, seat_number, seat_row, status) values (1, 1, 14, 'A', 'Served');  
insert into seat (id, id_room, seat_number, seat_row, status) values (2, 2, 7, 'G', 'Served');  
insert into seat (id, id_room, seat_number, seat_row, status) values (3, 3, 20, 'D', 'Served');  
insert into seat (id, id_room, seat_number, seat_row, status) values (4, 4, 17, 'E', 'Served');  
insert into seat (id, id_room, seat_number, seat_row, status) values (5, 5, 11, 'D', 'Served');  
insert into seat (id, id_room, seat_number, seat_row, status) values (6, 5, 15, 'D', 'Empty');

---

## Thêm dữ liệu bảng loại vé

insert into ticket_type (id, name, price) values (1, 'Normal', 50000);  
insert into ticket_type (id, name, price) values (2, 'VIP', 70000);  
insert into ticket_type (id, name, price) values (3, 'Couple', 160000);
insert into ticket_type (id, name, price) values (4, 'Kid', 40000);
insert into ticket_type (id, name, price) values (5, 'Elder', 40000);

---

## Thêm dữ liệu bảng vé

insert into ticket (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (1, 1, 1, 1, 1, 1, '40601 Melrose Avenue', '5:07 AM');  
insert into ticket (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (2, 2, 2, 2, 2, 2, '6 Everett Avenue', '10:03 AM');  
insert into ticket (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (3, 3, 3, 3, 3, 3, '37567 Leroy Parkway', '5:07 PM');  
insert into ticket (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (4, 4, 4, 4, 4, 4, '426 Logan Road', '1:24 PM');  
insert into ticket (id, id_employee, id_customer, id_film, id_room, id_seat, cinema_address, time_start) values (5, 5, 5, 5, 5, 5, '38228 Becker Lane', '12:25 PM');

---

## Thêm dữ liệu hoá đơn khách hàng

insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (1, '4/17/2021', '6:43 PM', 1, 1, 1, 10, '$3.68');    
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (2, '3/13/2021', '1:42 AM', 2, 2, 2, 1, '$5.64');  
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (3, '6/8/2021', '4:01 AM', 3, 3, 3, 5, '$0.27');  
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (4, '11/25/2021', '9:28 PM', 4, 4, 4, 9, '$0.52');  
insert into ticket_bill (id, date_bill, time_bill, id_ticket, id_ticket_type, id_discount, number_of_ticket, total_bill) values (5, '8/8/2021', '4:07 PM', 5, 5, 5, 5, '$8.73');

---

## Tạo bảng nhà cung cấp

insert into supplier (id, name, address, mobile, bank_account_number) values (1, 'Muxo', 'Nucho', 03109115900, 9875703656);  
insert into supplier (id, name, address, mobile, bank_account_number) values (2, 'Livetube', 'Doma', 00229736876, 0114701075);  
insert into supplier (id, name, address, mobile, bank_account_number) values (3, 'Gigazoom', 'Keda', 05285651436, 4309821707);  
insert into supplier (id, name, address, mobile, bank_account_number) values (4, 'Tagchat', 'Couva', 03870836467, 2777467447);  
insert into supplier (id, name, address, mobile, bank_account_number) values (5, 'Jabbersphere', 'Troll' 07576765818, 3169428047);