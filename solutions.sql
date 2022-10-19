USE publications;

-- Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id AS 'AUTHOR_ID', au_lname AS 'LAST_NAME', au_fname AS 'FIRST_NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM titles
LEFT JOIN titleauthor 
	ON titles.title_id = titleauthor.title_id
LEFT JOIN authors 
	ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers 
	ON titles.pub_id = publishers.pub_id
ORDER BY AUTHOR_ID;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id AS 'AUTHOR_ID', au_lname AS 'LAST_NAME', au_fname AS 'FIRST_NAME', count(titles.title) AS 'TITLE COUNT'
FROM titles
LEFT JOIN titleauthor 
	ON titles.title_id = titleauthor.title_id
LEFT JOIN authors 
	ON titleauthor.au_id = authors.au_id
LEFT JOIN publishers 
	ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY authors.au_id DESC;

-- Challenge 3 - Best Selling Authors

SELECT authors.au_id AS 'AUTHOR_ID', au_lname AS 'LAST_NAME', au_fname AS 'FIRST_NAME', sum(sales.qty) AS 'TOTAL'
FROM titles
LEFT JOIN titleauthor 
	ON titles.title_id = titleauthor.title_id
LEFT JOIN authors 
	ON titleauthor.au_id = authors.au_id
LEFT JOIN sales
	ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id AS 'AUTHOR_ID', au_lname AS 'LAST_NAME', au_fname AS 'FIRST_NAME', IFNULL(sum(sales.qty), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor 
	ON authors.au_id = titleauthor.au_id
LEFT JOIN sales 
	ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;