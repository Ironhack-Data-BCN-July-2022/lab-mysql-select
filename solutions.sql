USE publications;

-- challenge 1
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
    JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
	ORDER BY authors.au_id ASC;
	
SELECT * FROM titleauthor;

-- challenge 2
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, pub_name as PUBLISHER, count(titles.title_id) as TITLE_COUNT
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
    JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN publishers
		ON titles.pub_id = publishers.pub_id
	GROUP BY authors.au_id, publishers.pub_id
    ORDER BY authors.au_id DESC;

-- challenge 3
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
	FROM authors
    JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
    JOIN titles
		ON titleauthor.title_id = titles.title_id
	JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY author_id
    ORDER BY sum(sales.qty) DESC
    LIMIT 3;

-- challenge 4
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, IFNULL(sum(sales.qty),0) as TOTAL
	FROM authors
    LEFT JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
    LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
	GROUP BY author_id
    ORDER BY sum(sales.qty) DESC;


