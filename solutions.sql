USE publications;

SELECT COUNT(title) FROM titles;

SELECT titles.title, authors.au_id as Author_ID, au_fname as Author_first_name, au_lname as Author_last_name, pub_name as Publisher_name # CONCAT(au_fname, " ", au_lname) as full_name
	FROM titles
	LEFT JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id;
	
SELECT COUNT(title) FROM titles;

# Challenge 2
SELECT authors.au_id as Author_ID, au_fname as Author_first_name, au_lname as Author_last_name, pub_name as Publisher_name, COUNT(titles.title) # CONCAT(au_fname, " ", au_lname) as full_name
	FROM authors
	LEFT JOIN titleauthor
		ON authors.au_id= titleauthor.au_id
	LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
	LEFT JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, publishers.pub_id;
    
# Challenge 3
SELECT authors.au_id, authors.au_fname, authors.au_lname, SUM(sales.qty) AS total
	FROM authors
    LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY authors.au_id
    ORDER BY total DESC
    LIMIT 3;
		
# Challenge 4
SELECT authors.au_id, authors.au_fname, authors.au_lname, COALESCE(SUM(sales.qty), 0) AS total, CONCAT(authors.au_fname, " ", authors.au_lname) as FULL_NAME
    FROM authors
    LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY FULL_NAME, authors.au_id
    ORDER BY total DESC;