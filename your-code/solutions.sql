USE publications;
-- Q1
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, titles.title AS `TITLE`, publishers.pub_name AS `PUBLISHER`
FROM authors
RIGHT JOIN titleauthor ON authors.au_id = titleauthor.au_id
RIGHT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY `AUTHOR ID`;
-- Q2
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, COUNT(titles.title) AS `TITLE COUNT`, publishers.pub_name AS `PUBLISHER`
FROM authors
RIGHT JOIN titleauthor ON authors.au_id = titleauthor.au_id
RIGHT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY `AUTHOR ID` DESC;
-- Q3
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, SUM(sales.qty) AS `TOTAL`
FROM authors
RIGHT JOIN titleauthor ON authors.au_id = titleauthor.au_id
RIGHT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY `TOTAL` DESC
LIMIT 3;
-- Q4
SELECT authors.au_id AS `AUTHOR ID`, authors.au_lname AS `LAST NAME`, authors.au_fname AS `FIRST NAME`, IFNULL(SUM(sales.qty),0) AS `TOTAL`
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY `TOTAL` DESC