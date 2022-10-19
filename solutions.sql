USE publications;

SELECT authors.au_id as 'AUTHOR_ID', au_lname as 'LAST_NAME', au_fname as 'FIRST_NAME', title as 'TITLE', pub_name as 'PUBLISHER'
	FROM titles
    LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;
	
SELECT authors.au_id as 'AUTHOR_ID', au_lname as 'LAST_NAME', au_fname as 'FIRST_NAME', pub_name as 'PUBLISHER', count(titles.title) as 'TITLE COUNT'
	FROM titles
    LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors ON titleauthor.au_id = authors.au_id
	LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
    GROUP BY authors.au_id, publishers.pub_id
    ORDER BY authors.au_id DESC;
    
SELECT authors.au_id as 'AUTHOR_ID', au_lname as 'LAST_NAME', au_fname as 'FIRST_NAME', sum(sales.qty) as 'TOTAL'
	FROM titles
    LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors ON titleauthor.au_id = authors.au_id
    LEFT JOIN sales ON titles.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY sum(sales.qty) DESC
    LIMIT 3;
    
SELECT authors.au_id as 'AUTHOR_ID', au_lname as 'LAST_NAME', au_fname as 'FIRST_NAME', IFNULL(sum(sales.qty), 0) as TOTAL
	FROM authors
	LEFT JOIN titleauthor ON  authors.au_id = titleauthor.au_id
    LEFT JOIN sales ON titleauthor.title_id = sales.title_id
    GROUP BY authors.au_id
    ORDER BY TOTAL DESC;

