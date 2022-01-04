Tạo bảng Teacher

CREATE TABLE teacher(
id INT AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile VARCHAR NOT NULL,
    address TEXT NOT NULL
    
)

Nhập dữ liệu Teacher

INSERT INTO `teacher`(`id`, `name`, `email`, `mobile`, `address`) VALUES 
(1,'Long','long@gmail.com','0902421556','HN'), 
(2,'Ly','ly@gmail.com','0902456574','HCM'), 
(3,'Quy','quy@gmail.com','0943435666','BN');

Tạo bảng Class

CREATE TABLE class(
id INT PRIMARY KEY,
    name TEXT NOT NULL,
    id_teacher INT NOT NULL,
    FOREIGN KEY (id_teacher) REFERENCES teacher(id) 
)

Thêm dữ liệu Class

INSERT INTO `class`(`id`, `name`, `id_teacher`) VALUES 
(4,'Lop 1','1'),
(5,'Lớp 2','2'),
(6,'Lớp 3','3');

Tạo bảng Student

CREATE TABLE student (
id INT PRIMARY KEY,
    name TEXT NOT NULL,
    birthday DATE NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    id_class INT NOT NULL
    FOREIGN KEY (id_class) REFERENCES class(id)
)

Thêm dữ liệu Student

INSERT INTO `student`(`id`, `name`, `birthday`, `address`, `mobile`, `email`, `id_class`) VALUES 
(11,'Tùng','1992-1-1','HN','0983242765','tung@gmail.com',4),
(12,'Tiên','1995-2-2','NB','0954950942','tien@gmail.com',5),
(13,'Trang','1999-11-3','HN','0939025803','trang@gmail.com',6),
(14,'Vu','1998-4-5','HCM','0989325097','vu@gmail.com',4),
(15,'My','2000-4-7','LS','0932897922','my@gmail.com',5);

Tạo bảng Subject

CREATE TABLE subject(
id INT PRIMARY KEY,
    name TEXT NOT NULL
)

Thêm dữ liệu Subject

INSERT INTO `subject`(`id`, `name`) VALUES 
(111,'Toán'),
(112,'Văn'),
(113,'Anh');

Tạo bảng Point

CREATE TABLE point(
id INT PRIMARY KEY AUTO_INCREMENT,
id_subject INT NOT NULL,
FOREIGN KEY (id_subject) REFERENCES subject(id),
id_student INT NOT NULL,
FOREIGN KEY (id_student) REFERENCES student(id),
point FLOAT NOT NULL
)

Thêm dữ liệu Point

INSERT INTO `point`(`id`, `id_subject`, `id_student`, `point`) VALUES 
(null,111,11,9.5),
(null,112,12,8),
(null,113,13,7.4),
(null,111,11,10),
(null,112,12,6.9);