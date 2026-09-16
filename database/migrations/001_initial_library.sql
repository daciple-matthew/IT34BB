-- #1 students table

CREATE TABLE IF NOT EXISTS students (
-- primary key for students table
student_id INT PRIMARY KEY AUTO_INCREMENT,

-- student name
student_first_name VARCHAR(50) NOT NULL,
student_last_name VARCHAR(56) NOT NULL,

-- student course
student_course VARCHAR(50) NOT NULL,

-- student created at timestamp
student_created_at TIMESTAMP NOT NULL
DEFAULT CURRENT_TIMESTAMP


) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

--#2 books table
CREATE TABLE IF NOT EXISTS books (
book_id INT PRIMARY KEY AUTO_INCREMENT,

-- books details
book_title VARCHAR(100) NOT NULL,
book_author VARCHAR(100) NOT NULL,
book_category VARCHAR(50) NOT NULL,

-- timestamp
book_created_at TIMESTAMP NOT NULL
DEFAULT CURRENT_TIMESTAMP


) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

--#3 borrow table
CREATE TABLE IF NOT EXISTS borrow (
    -- primary key for borrow
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- foreign key references
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    
    -- borrow timestamp not null by default
    borrow_date TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

    -- borrow return  timestamp not null by default 
    borrow_return_date TIMESTAMP NULL
    DEFAULT NULL,

    -- borrow table constraints and foreign keys
    CONSTRAINT fk_borrow_student
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

    CONSTRAINT fk_borrow_book
    FOREIGN KEY (book_id)
    REFERENCES books(book_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT


) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;

-- #1 insert statement #1 insert students
INSERT INTO students (
student_first_name,
student_last_name,
student_course
) VALUES
('DACIPLE'. 'MATEO', 'BSBA'),
('CHLOE', 'ONAHON', 'BSAN'),
('WHO', 'IZ', 'BSA'),
('KRISTIA', 'LAPUZ', 'BSIT');

-- #2 insert statement #2 insert books
INSERT INTO books (
    book_title,
    book_author,
    book_category
) VALUES
('Something About Sophie', 'Mary Kay McComas', 'Thriller')
('The Girls of Ennismore', 'Patricia Falvey', 'Historical Fiction'),
('Animal Blessings', 'June Cotner', 'Nonfiction Anthology'),
('The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-Age Fiction');

-- #3 insert statement #3 borrow
INSERT INTO borrow (
    student_id,
    book_id
) VALUES
(1,2),
(2,1),
(3,3);