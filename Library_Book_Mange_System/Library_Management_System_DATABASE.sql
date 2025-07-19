-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: library_details
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS book;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE book (
  Book_Id int NOT NULL,
  Title varchar(50) NOT NULL,
  Author varchar(50) NOT NULL,
  Category varchar(50) DEFAULT NULL,
  Available_Copies int DEFAULT '1',
  PRIMARY KEY (Book_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES book WRITE;
/*!40000 ALTER TABLE book DISABLE KEYS */;
INSERT INTO book VALUES (101,'Introduction to Algorithms','Thomas H. Cormen','Computer Science',3),(102,'The Great Gatsby','F. Scott Fitzagerland','Literature',2),(103,'Advanced Physics','David Halliday','Physics',1),(104,'Fundamentals of Computer','V.Rajaraman','Computer Application',5),(105,'Mathametics for computer Science','Eric Lehman','Mathematics',1);
/*!40000 ALTER TABLE book ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS borrow;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE borrow (
  Borrow_Id int NOT NULL,
  Student_Id int DEFAULT NULL,
  Book_Id int DEFAULT NULL,
  Librarian_Id int DEFAULT NULL,
  Borrow_Date date DEFAULT (curdate()),
  Return_date date DEFAULT NULL,
  PRIMARY KEY (Borrow_Id),
  KEY Student_Id (Student_Id),
  KEY Book_Id (Book_Id),
  KEY Librarian_Id (Librarian_Id),
  CONSTRAINT borrow_ibfk_1 FOREIGN KEY (Student_Id) REFERENCES student (Student_Id),
  CONSTRAINT borrow_ibfk_2 FOREIGN KEY (Book_Id) REFERENCES book (Book_Id),
  CONSTRAINT borrow_ibfk_3 FOREIGN KEY (Librarian_Id) REFERENCES librarians (Librarian_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES borrow WRITE;
/*!40000 ALTER TABLE borrow DISABLE KEYS */;
INSERT INTO borrow VALUES (401,1,105,3031,'2025-07-01','2025-07-15'),(402,2,103,3032,'2025-07-01','2025-07-22'),(403,3,101,3033,'2025-07-03',NULL),(404,4,102,3034,'2025-07-05',NULL),(405,5,105,3035,'2025-07-10','2025-08-03');
/*!40000 ALTER TABLE borrow ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_bor_record`
--

DROP TABLE IF EXISTS lib_bor_record;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE lib_bor_record (
  Librarian_Id int DEFAULT NULL,
  Student_Id int DEFAULT NULL,
  Book_Id int DEFAULT NULL,
  Borrow_Date date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_bor_record`
--

LOCK TABLES lib_bor_record WRITE;
/*!40000 ALTER TABLE lib_bor_record DISABLE KEYS */;
INSERT INTO lib_bor_record VALUES (3031,1,401,'2025-07-04'),(3031,2,402,'2025-07-12'),(3032,3,404,'2025-07-05');
/*!40000 ALTER TABLE lib_bor_record ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarians`
--

DROP TABLE IF EXISTS librarians;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE librarians (
  Librarian_Id int NOT NULL,
  `Name` varchar(30) NOT NULL,
  Experience_Years int DEFAULT '0',
  PRIMARY KEY (Librarian_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarians`
--

LOCK TABLES librarians WRITE;
/*!40000 ALTER TABLE librarians DISABLE KEYS */;
INSERT INTO librarians VALUES (3031,'Mr. Pravin',5),(3032,'Ms. Kavitha',3),(3033,'Dr. Johnson',7),(3034,'Mr. David',2),(3035,'Ms. Ananya',0),(3036,'Mr. Navin',2);
/*!40000 ALTER TABLE librarians ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_borrow`
--

DROP TABLE IF EXISTS stud_borrow;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE stud_borrow (
  Student_Id int DEFAULT NULL,
  Book_Id int DEFAULT NULL,
  Title varchar(50) DEFAULT NULL,
  KEY Student_Id (Student_Id),
  CONSTRAINT stud_borrow_ibfk_1 FOREIGN KEY (Student_Id) REFERENCES student (Student_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_borrow`
--

LOCK TABLES stud_borrow WRITE;
/*!40000 ALTER TABLE stud_borrow DISABLE KEYS */;
INSERT INTO stud_borrow VALUES (1,101,'Introduction to Algorithms'),(1,104,'Fundamentals of Computer'),(1,103,'Advanced Physics');
/*!40000 ALTER TABLE stud_borrow ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud_bymanybooks`
--

DROP TABLE IF EXISTS stud_bymanybooks;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE stud_bymanybooks (
  Student_Id int DEFAULT NULL,
  Book_Id int DEFAULT NULL,
  Title varchar(50) DEFAULT NULL,
  KEY Student_Id (Student_Id),
  CONSTRAINT stud_bymanybooks_ibfk_1 FOREIGN KEY (Student_Id) REFERENCES student (Student_Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud_bymanybooks`
--

LOCK TABLES stud_bymanybooks WRITE;
/*!40000 ALTER TABLE stud_bymanybooks DISABLE KEYS */;
INSERT INTO stud_bymanybooks VALUES (1,104,'Fundamentals of Computer'),(2,102,'The Great Gatsby'),(1,103,'Advanced Physics'),(3,101,'Introduction to Algorithms'),(4,105,'Mathametics for computer Science'),(5,102,'The Great Gatsby'),(3,104,'Fundamentals of Computer'),(2,103,'Advanced Physics');
/*!40000 ALTER TABLE stud_bymanybooks ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS student;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE student (
  Student_Id int NOT NULL,
  `Name` varchar(30) NOT NULL,
  Email varchar(50) NOT NULL,
  Department varchar(100) DEFAULT NULL,
  Gender char(1) DEFAULT 'M',
  PRIMARY KEY (Student_Id),
  UNIQUE KEY Email (Email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES student WRITE;
/*!40000 ALTER TABLE student DISABLE KEYS */;
INSERT INTO student VALUES (1,'Saravanan','Saravanan@gmail.com','Mathematics','M'),(2,'Sathish','Sathish@gmail.com','Physics','M'),(3,'Priya','Priya@gmail.com','Computer Science','F'),(4,'Lakshmanan','Lakshmanan@gmil.com','Information Technology','M'),(5,'kaviya','Kaviya@gmail.com','Computer Application','F'),(6,'Sriram','Sriram@gmail.com','Data Science','M');
/*!40000 ALTER TABLE student ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09 11:50:06
