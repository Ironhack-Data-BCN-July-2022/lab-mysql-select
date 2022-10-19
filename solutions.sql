USE publications;

-- Challenge 1:  Who Have Published What At Where?
SELECT au.au_id, au.au_lname, au.au_fname, titles.title, publishers.pub_name
FROM authors as au
JOIN titleauthor
	ON au.au_id = titleauthor.au_id
JOIN titles
	ON titleauthor.title_id = titles.title_id
JOIN publishers
	ON titles.pub_id = publishers.pub_id
ORDER BY au_id ASC;

-- Checking if it is the same length than table titleauthor
SELECT *
FROM titleauthor;

-- Challenge 2: Who Have Published How Many At Where?
SELECT au.au_id, au.au_lname, au.au_fname, publishers.pub_name, COUNT(titles.title_id) AS TITLE_COUNT, SUM(COUNT(titles.title_id))
FROM authors as au
JOIN titleauthor
	ON au.au_id = titleauthor.au_id
JOIN titles
	ON titleauthor.title_id = titles.title_id
JOIN publishers
	ON titles.pub_id = publishers.pub_id
GROUP BY au_id,pub_name
ORDER BY au_id DESC;

-- Checking if same length than titleauthor:
SELECT COUNT(title_id)
FROM titleauthor;

-- Challenge 3: Best Selling Authors
SELECT au.au_id, au.au_lname, au.au_fname, SUM(sales.qty) AS TOTAL
	FROM authors as au
	JOIN titleauthor
		ON au.au_id = titleauthor.au_id
	JOIN sales
		ON titleauthor.title_id = sales.title_id
	GROUP BY au.au_id
	ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4: Best Selling Authors Ranking
SELECT au.au_id, au.au_lname, au.au_fname, IFNULL(SUM(sales.qty),"0") AS TOTAL
	FROM authors as au
	LEFT JOIN titleauthor
		ON au.au_id = titleauthor.au_id
	LEFT JOIN sales
		ON titleauthor.title_id = sales.title_id
	GROUP BY au.au_id
	ORDER BY SUM(sales.qty) DESC;

SELECT DISTINCT(title_id), title
FROM titles;
SELECT title_id, qty
FROM sales;





-- SELECT titles.title, au_lname
	-- FROM titles
   --  LEFT JOIN titleauthor
		-- ON titles.title_id = titleauthor.title_id
	-- LEFT JOIN authors
		-- ON titleauthor.au_id = authors.au_id;

