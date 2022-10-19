USE publications;

-- Challenge 1 - Who Have Published What At Where?
-- In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers.
-- Your output should have at least the following columns:

--     AUTHOR ID - the ID of the author
--     LAST NAME - author last name
--     FIRST NAME - author first name
--     TITLE - name of the published title
--     PUBLISHER - name of the publisher where the title was published

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titles.title_id = titleauthor.title_id
INNER JOIN publishers 
	ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id
;


-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, publishers.pub_name as PUBLISHER, count(*)
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titles.title_id = titleauthor.title_id
INNER JOIN publishers 
	ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id DESC
;


-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
-- Requirements:

--     Your output should have the following columns:
--         AUTHOR ID - the ID of the author
--         LAST NAME - author last name
--         FIRST NAME - author first name
--         TOTAL - total number of titles sold from this author
--     Your output should be ordered based on TOTAL from high to low.
--     Only output the top 3 best selling authors.

SELECT authors.au_id, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, SUM(sales.qty) as SALES
FROM authors
INNER JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
INNER JOIN titles
	ON titles.title_id = titleauthor.title_id
INNER JOIN sales
	ON sales.title_id = titles.title_id
GROUP BY authors.au_id -- titles.title_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3
;

-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
-- Also order your results based on TOTAL from high to low.

SELECT authors.au_id, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, IFNULL(SUM(sales.qty), 0) as SALES
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
	ON sales.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC
;

