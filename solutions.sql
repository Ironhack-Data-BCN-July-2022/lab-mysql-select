-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TITLE - name of the published title
-- PUBLISHER - name of the publisher where the title was published

USE publications; 

select * from authors;

-- COLUMNS: au_id , au_lname, au_fname, title, pub_name 
-- TABLES: author, titles, titleauthor, publishers
-- Common denominator: title_id, au_id, pub_id

SELECT authors.au_id as Author, authors.au_lname as `Last Name` , authors.au_fname as `First Name` , titles.title as Title , publishers.pub_name as `Publisher Name` 
	FROM authors
	LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	LEFT join titles
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id as Author, authors.au_lname as `Last Name` , authors.au_fname as `First Name` , publishers.pub_name as `Publisher Name`, count(*)
	FROM authors
	INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	INNER join titles
		ON titles.title_id = titleauthor.title_id
	INNER JOIN publishers
		ON titles.pub_id = publishers.pub_id
        GROUP BY Author, `Publisher Name` 
        ORDER BY Author DESC;
        
-- Challenge 3 - Best Selling Authors

SELECT authors.au_id as Author, authors.au_lname as `Last Name` , authors.au_fname as `First Name`, SUM(sales.qty) as Sales
	FROM authors
	INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	INNER join titles
		ON titles.title_id = titleauthor.title_id
	INNER JOIN sales
		ON titles.title_id = sales.title_id
        GROUP BY Author
        ORDER BY Sales DESC
        LIMIT 3;
        
-- Challenge 4 - Best Selling Authors Ranking
SELECT authors.au_id as Author, authors.au_lname as `Last Name` , authors.au_fname as `First Name`, ifnull(SUM(sales.qty),0) as Sales
	FROM authors
	LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	LEFT join titles
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
        GROUP BY Author
        ORDER BY Sales DESC;
        
