USE publications;

-- CHALLENGE 1
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", title AS "TITLE", publishers.pub_name AS "PUBLISHER"
	FROM titles
    LEFT JOIN titleauthor 
		ON titles.title_id = titleauthor.title_id
		LEFT JOIN authors
			ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id
	ORDER BY authors.au_id asc;
-- CHALLENGE 2
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER", COUNT(titles.title_id) AS "TITLE COUNT"
	FROM titles
    LEFT JOIN titleauthor 
		ON titles.title_id = titleauthor.title_id
		LEFT JOIN authors
			ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, publishers.pub_name
	ORDER BY authors.au_id desc;
-- CHALLENGE 3
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", sum(titles.ytd_sales) AS "TOTAL"
	FROM titles
    LEFT JOIN titleauthor 
		ON titles.title_id = titleauthor.title_id
		LEFT JOIN authors
			ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id
	ORDER BY TOTAL desc
    LIMIT 3;
-- CHALLENGE 4
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", sum(titles.ytd_sales) AS "TOTAL"
	FROM titles
    LEFT JOIN titleauthor 
		ON titles.title_id = titleauthor.title_id
		LEFT JOIN authors
			ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id
	ORDER BY TOTAL desc
    LIMIT 23;