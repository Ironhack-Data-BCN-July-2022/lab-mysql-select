USE publications;

-- Challenge 1
-- What titles each author has published at which publishers

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title,  publishers.pub_name
FROM publishers
JOIN titles
	ON  publishers.pub_id = titles.pub_id 
JOIN titleauthor
	ON titleauthor.title_id = titles.title_id
JOIN authors
	ON titleauthor.au_id = authors.au_id
    ORDER BY au_id;

    
-- Challenge 2
-- How many titles each author has published at each publisher

 SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(title) AS count
 FROM authors 
 JOIN titleauthor
	ON authors.au_id = titleauthor.au_id 
JOIN titles
	ON  titles.title_id = titleauthor.title_id 
JOIN publishers
	ON  titles.pub_id = publishers.pub_id
GROUP BY au_id, pub_name
ORDER BY au_id DESC;
    
-- Challenge 3
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS count
FROM sales
JOIN titles
	ON  sales.title_id = titles.title_id 
JOIN titleauthor
	ON titleauthor.title_id = titles.title_id
JOIN authors
	ON titleauthor.au_id = authors.au_id
    GROUP BY au_id
    ORDER BY count DESC
    LIMIT 3;
    
    
-- Challenge 4_ Best Selling Authors Ranking

SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty), 0) AS count
FROM sales
JOIN titles
	ON  sales.title_id = titles.title_id 
JOIN titleauthor
	ON titleauthor.title_id = titles.title_id
RIGHT JOIN authors
	ON titleauthor.au_id = authors.au_id
    GROUP BY au_id

    ORDER BY count DESC;