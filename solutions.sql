USE publications;

#####################
#	CHALLENGE 1		#
#####################

SELECT 
	au.au_id AS "AUTHOR ID", 
    au_lname AS "LAST NAME", 
    au_fname AS "FIRST NAME", 
    title AS "TITLE", 
    pub_name as "PUBLISHER"
FROM publications.authors au
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles tt ON ta.title_id = tt.title_id
LEFT JOIN publications.publishers pp ON tt.pub_id = pp.pub_id;

#####################
#	CHALLENGE 2		#
#####################

SELECT 
	au.au_id AS "AUTHOR ID", 
    au_lname AS "LAST NAME", 
    au_fname AS "FIRST NAME", 
    pub_name as "PUBLISHER",
    COUNT(tt.title_id) AS "TITLE COUNT"
FROM publications.authors au
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles tt ON ta.title_id = tt.title_id
LEFT JOIN publications.publishers pp ON tt.pub_id = pp.pub_id
GROUP BY au.au_id, au_lname, au_fname, pub_name; 

#####################
#	CHALLENGE 3		#
#####################

SELECT 
	au.au_id AS "AUTHOR ID", 
    au_lname AS "LAST NAME", 
    au_fname AS "FIRST NAME", 
    SUM(qty) as "TOTAL"
FROM publications.authors au
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles tt ON ta.title_id = tt.title_id
LEFT JOIN publications.sales ss ON ss.title_id = tt.title_id
GROUP BY au.au_id, au_lname, au_fname 
ORDER BY TOTAL DESC
LIMIT 3;

#####################
#	CHALLENGE 4		#
#####################

SELECT 
	au.au_id AS "AUTHOR ID", 
    au_lname AS "LAST NAME", 
    au_fname AS "FIRST NAME", 
    COALESCE(SUM(qty),0) as "TOTAL" 
FROM publications.authors au
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles tt ON ta.title_id = tt.title_id
LEFT JOIN publications.sales ss ON ss.title_id = tt.title_id
GROUP BY au.au_id, au_lname, au_fname 
ORDER BY TOTAL DESC
LIMIT 23;

