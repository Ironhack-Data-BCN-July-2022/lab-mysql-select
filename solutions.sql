USE publications;
-- CHALLENGE 1 ------------------------------------------------------------------------------

SELECT title, pub_name, au_lname, au_fname, authors.au_id FROM titles
	JOIN publishers
    ON titles.pub_id = publishers.pub_id
    LEFT JOIN titleauthor
    ON titles.title_id = titleauthor.title_id
    JOIN authors
    ON titleauthor.au_id = authors.au_id;

-- CHALLENGE 2 ----------------------------------------------------------------------------------------------
  
SELECT COUNT(title), authors.au_id, pub_name, au_lname, au_fname 
	FROM titles 
   
    JOIN publishers
    ON titles.pub_id = publishers.pub_id
    
    JOIN titleauthor
    ON titles.title_id = titleauthor.title_id
    
    JOIN authors
    ON titleauthor.au_id = authors.au_id
    
    group by authors.au_id
    ORDER BY COUNT(title) DESC;

-- CHALLENGE 3 ----------------------------------------------------------------------------------------------
    
    SELECT SUM(qty), authors.au_id, au_lname, au_fname 
	FROM titles 
   
    JOIN publishers
    ON titles.pub_id = publishers.pub_id
    
    JOIN titleauthor
    ON titles.title_id = titleauthor.title_id
    
    JOIN sales
    ON titles.title_id = sales.title_id
    
    JOIN authors
    ON titleauthor.au_id = authors.au_id
    
    group by authors.au_id
    ORDER BY SUM(qty) DESC
    LIMIT 3;

-- CHALLENGE 4 ----------------------------------------------------------------------------------------------
    
    SELECT IFNULL(SUM(qty), 0), authors.au_id, au_lname, au_fname 
	FROM authors 
    
    LEFT JOIN titleauthor
    ON authors.au_id = titleauthor.au_id
    
    LEFT JOIN sales
    ON titleauthor.title_id = sales.title_id
    
    group by authors.au_id
    ORDER BY SUM(qty) DESC;
   
   --------------------------------------------------------------------------------
