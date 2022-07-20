USE publications;
-- Challenge 1
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', title as 'TITLE', pub_name as 'PUBLISHER'
	FROM titles
    LEFT JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id=publishers.pub_id;
-- Challenge 2
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', pub_name as 'PUBLISHER', COUNT(titles.title) as "TITLE COUNT"
	FROM authors
	JOIN titleauthor
		ON authors.au_id= titleauthor.au_id
	JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id=publishers.pub_id
    GROUP BY authors.au_id, pub_name;
-- Challenge 3
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', SUM(sales.qty) as TOTAL
	FROM authors
	JOIN titleauthor
		ON authors.au_id= titleauthor.au_id
	JOIN sales
		ON titleauthor.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY TOTAL DESC
    LIMIT 3;
	
-- Challenge 4
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', COALESCE(SUM(sales.qty), 0) as TOTAL
	FROM authors
	LEFT JOIN titleauthor
		ON authors.au_id= titleauthor.au_id
	LEFT JOIN sales
		ON titleauthor.title_id = sales.title_id
	GROUP BY authors.au_id
	ORDER BY TOTAL DESC