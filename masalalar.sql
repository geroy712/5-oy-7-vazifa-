CREATE TABLE books (
   book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    genre VARCHAR(100),
    publication_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);


CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    country VARCHAR(100)
);


CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    founded_year INT
);


CREATE TABLE book_reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    review_text TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO authors (name, birth_date, country)
VALUES 
('Fyodor Dostoevsky', '1821-11-11', 'Russia'),
('George Orwell', '1903-06-25', 'United Kingdom'),
('Jane Austen', '1775-12-16', 'United Kingdom'),
('Haruki Murakami', '1949-01-12', 'Japan'),
('Gabriel García Márquez', '1927-03-06', 'Colombia');


INSERT INTO publishers (name, city, founded_year)
VALUES 
('Penguin Books', 'London', 1935),
('HarperCollins', 'New York', 1989),
('Kodansha', 'Tokyo', 1909),
('Vintage Español', 'Mexico City', 1954),
('Random House', 'New York', 1927);


INSERT INTO books (title, author_id, publisher_id, genre, publication_date, price)
VALUES 
('Crime and Punishment', 1, 1, 'Classic', '1866-01-01', 12.99),
('1984', 2, 2, 'Dystopian', '1949-06-08', 14.99),
('Pride and Prejudice', 3, 1, 'Romance', '1813-01-28', 10.99),
('Kafka on the Shore', 4, 3, 'Magical Realism', '2002-09-12', 16.99),
('One Hundred Years of Solitude', 5, 4, 'Magical Realism', '1967-05-30', 18.99);


INSERT INTO book_reviews (book_id, review_text, rating, review_date)
VALUES 
(1, 'Amazing depth and storytelling!', 5, '2024-11-01'),
(2, 'A haunting vision of the future.', 4, '2024-11-05'),
(3, 'A timeless love story.', 5, '2024-11-10'),
(4, 'Incredible characters and surreal themes.', 4, '2024-11-15'),
(5, 'A masterpiece of magical realism.', 5, '2024-11-18');

SELECT * FROM books;
SELECT title AS "Book Title", price AS "Book Price" FROM books;
SELECT * FROM books ORDER BY price DESC;
SELECT * FROM books WHERE genre = 'Magical Realism';
SELECT * FROM books LIMIT 3;
SELECT * FROM books WHERE genre IN ('Dystopian', 'Romance');
SELECT * FROM books WHERE price BETWEEN 10 AND 15;
SELECT * FROM books WHERE title LIKE '%and%';
SELECT * FROM book_reviews WHERE review_text IS NULL;
SELECT genre, COUNT(*) AS "Total Books" FROM books GROUP BY genre;
SELECT 
    books.title AS "Book Title",
    authors.name AS "Author",
    publishers.name AS "Publisher",
    books.price AS "Price"
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN publishers ON books.publisher_id = publishers.publisher_id;

SELECT COUNT(*) AS "Total Books" FROM books;


SELECT AVG(price) AS "Average Price" FROM books;


SELECT SUM(price) AS "Total Price" FROM books;


