
                           -- Library Book ManageMent System
                           
 -- Table requirements
 create database Library_Details;
 use Library_Details;
 -- Student
 create table Student(Student_Id int primary key, Name varchar(30) not null,
 Email varchar(50) not null unique, Department varchar(100), Gender char(1) default 'M');
 desc Student;
 -- Books
 create table Book(Book_Id int primary key, Title varchar(50) not null ,
 Author varchar(50) not null, Category varchar(50), Available_Copies int default 1);
 desc Book;
 
--  Librarians
create table Librarians(Librarian_Id int primary key,Name varchar(30) not null,Experience_Years int default 0);
 desc Librarians;

-- Borrower
create table Borrow(Borrow_Id int primary key, Student_Id int, Book_Id int,Librarian_Id int, 
Borrow_Date date, Return_date date,
foreign key(Student_Id) references Student(Student_Id),
foreign key(BooK_Id) references Book(Book_Id),
foreign key(Librarian_Id) references Librarians(Librarian_Id));
desc Borrow;


insert into Student values(1,'Saravanan','Saravanan@gmail.com','Mathematics','M'),
(2,'Sathish','Sathish@gmail.com','Physics','M'),(3,'Priya','Priya@gmail.com','Computer Science','F'),
(4,'Lakshmanan','Lakshmanan@gmil.com','Information Technology',default),
(5,'kaviya','Kaviya@gmail.com','Computer Application','F');
select * from Student;

insert into Book values(101,'Introduction to Algorithms','Thomas H. Cormen','Computer Science',3),
(102,'The Great Gatsby','F. Scott Fitzagerland','Literature',2),
(103,'Advanced Physics','David Halliday','Physics',default),
(104,'Fundamentals of Computer','V.Rajaraman','Computer Application',5),
(105,'Mathametics for computer Science','Eric Lehman','Mathematics',1);

insert into Librarians values(3031,'Mr. Pravin',5),(3032,'Ms. Kavitha',3),
(3033,'Dr. Johnson',7),(3034,'Mr. David',2),(3035,'Ms. Ananya',default);
 select * from Librarians;

insert into Borrow values(401,1,105,3031,'2025-07-01','2025-07-15'),
(402,2,103,3032,'2025-07-01','2025-07-22'),
(403,3,101,3033,'2025-07-03',null),
(404,4,102,3034,'2025-07-05',null),
(405,5,105,3035,'2025-07-10','2025-08-03');
select * from Borrow;

-- one to many :
create table Stud_Borrow( Student_Id int, Book_Id int , Title varchar(50),
foreign key(Student_Id) references Student(Student_Id));

insert into Stud_Borrow values(1,101,'Introduction to Algorithms'),(2,104,'Fundamentals of Computer'),
(3,103,'Advanced Physics');
select * from Stud_Borrow;
 update Stud_Borrow set Student_Id=1 where Book_Id=104;

-- Many to Many

create table Stud_ByManyBooks( Student_Id int, Book_Id int , Title varchar(50),
foreign key(Student_Id) references Student(Student_Id));
desc Stud_ByManyBooks;

insert into Stud_ByManyBooks values(1,104,'Fundamentals of Computer'),(2,102,'The Great Gatsby'),
(1,103,'Advanced Physics'),(3,101,'Introduction to Algorithms'),
(4,105,'Mathametics for computer Science'),(5,102,'The Great Gatsby'),(3,104,'Fundamentals of Computer'),
(2,103,'Advanced Physics');
select * from Stud_ByManyBooks;

-- one to many :
create table Lib_Bor_Record( Librarian_Id int,Student_Id int, Book_Id int,Borrow_Date date);
insert into Lib_Bor_Record values(3031,1,401,'2025-07-04'),(3031,2,402,'2025-07-12'),(3032,3,404,'2025-07-05');
select * from Lib_Bor_Record;

-- A. CRUD OPERATION 
insert into Student values(6,'Sriram','Sriram@gmail.com','Data Science','M');
select * from Student;
insert into Book values(106,'Calculus','James Stewart','Calculas',4);
select * from Book;
insert into Librarians values(3036,'Mr. Navin',2);
select * from Librarians;
insert into Borrow values(406,6,106,3036,'2025-07-10','2025-08-12');
select * from Borrow;
delete from  book where Book_Id=106;
select * from Student;

				-- JOIN QUERIES
                
select Student.Name,Book.Title from Borrow join Student on Student.Student_Id = Borrow.Student_Id join 
Book on Book.Book_Id = Borrow.Book_Id; 

select Librarians.Name , Book.Title from Borrow join Book on 
 Borrow.Book_Id = Book.Book_Id  join Librarians on Librarians.Librarian_Id = Borrow.Librarian_Id;
 
 select Book.Title,Borrow.Borrow_Date,Borrow.return_date from Borrow join Book on Book.Book_Id=Borrow.Book_Id
 where Borrow.Student_Id =1;
 
			-- 	Aggregate Queries
select Student.Name , count(*) from Borrow join Student on Borrow.Student_Id = Student.Student_Id
group by Student.Student_Id;

select Book.Title,count(*) as Heigest from Borrow join Book on Book.Book_Id=Borrow.Book_Id
group by Borrow.Book_Id
order by Heigest desc
limit 1;
 select Name, avg(Experience_Years) as Average_Exp from Librarians 
 group by Name; 
 
 select count(Student_Id) as Total_Stud from Student;
 
 select min(Borrow_date) as First_Borrowed , max(Borrow_date) as Last_Borrowed from Borrow
 where Book_Id=105;

               -- Library Book Management System (Mysql)
-- This project contains a database schema for Managing Books,Students,Librarians , and Borrow 
-- in a Library. 
-- It Includes four tables : Students,Books,Librarians, and Borrow .
-- Relationships are implemented  via foreign keys to support tracking which students borrow which books,and 
-- which librarians issued them.
-- Use the provided SQL scripts to create tables,insert sample data,perform CURD operation, 
-- and execute queries to retrieve and analyze borrowing information.
















            


				







 
