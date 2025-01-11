-- Active: 1736592755508@@127.0.0.1@3306@blogs

-- authors Table
CREATE TABLE authors(
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- categories Table
CREATE TABLE categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



-- blogs Table
CREATE TABLE blogs(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    category_id INT NOT NULL,
    author_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- CRUD Operations for authors Table

-- Create: Add a new author
INSERT INTO authors (author_name) VALUES ("John Doe");


-- Read: Retrieve all authors
SELECT * FROM authors;


-- Read: Retrieve a specific author by ID
SELECT * FROM authors WHERE id = 3;


-- Update: Update an author’s name
UPDATE authors SET author_name = "Jasim Doe" WHERE id = 2;


-- Delete: Delete an author by ID
DELETE FROM authors WHERE id = 1;




-- CRUD Operations for categories Table

-- Create: Add a new category
INSERT INTO categories (category_name) VALUES ("My Category");

-- Read: Retrieve all categories
SELECT * FROM categories;


-- Read: Retrieve a specific category by ID
SELECT * FROM categories WHERE id = 5

-- Update: Update a category name
UPDATE categories SET category_name = "Our Category" WHERE id = 1;

-- Delete: Delete a category by ID
DELETE FROM categories WHERE id = 1;





-- CRUD Operations for blogs Table

-- Create: Add a new blog
INSERT INTO blogs (title, body, category_id, author_id) 
VALUES ("My Blog", "My blog's content", 2, 2)


-- Read: Retrieve all blogs
SELECT * FROM blogs;

-- Read: Retrieve a specific blog by ID
SELECT * FROM blogs WHERE id = 1;



-- Read: Retrieve blogs with their category and author
SELECT blogs.title, blogs.body, categories.category_name, authors.author_name
FROM blogs
JOIN categories ON blogs.category_id = categories.id
JOIN authors ON blogs.author_id = authors.id;

-- Update: Update a blog's title
UPDATE blogs SET title = "My Updated Blog Title" WHERE id = 1;


-- Update: Update a blog's category or author
UPDATE blogs SET category_id = 4, author_id = 2 WHERE id = 10;

-- Delete: Delete a blog by ID
DELETE FROM blogs WHERE id = 1;



-- To get all blogs written by a specific author:
SELECT authors.author_name, blogs.title, blogs.body
FROM blogs
JOIN authors ON blogs.author_id = authors.id
WHERE authors.id = 3;


-- To get all blogs under a specific category:
SELECT categories.category_name, blogs.title, blogs.body
FROM blogs
JOIN categories ON blogs.category_id = categories.id
WHERE categories.category_name = "Lifestyle";

