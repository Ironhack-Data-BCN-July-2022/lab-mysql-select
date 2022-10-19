USE publications;

-- Challenge 1: Who Have Published What At Where? -- 
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
	FROM titles AS t
		JOIN titleauthor AS ta ON ta.title_id = t.title_id 
		JOIN authors AS a ON a.au_id = ta.au_id
		JOIN publishers AS p ON p.pub_id = t.pub_id;
    

-- Challenge 2: Who Have Published How Many At Where? -- 
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIST NAME', p.pub_name AS 'PUBLISHER', count(t.title_id) AS 'TITLE COUNT'
	FROM titles AS t
		JOIN titleauthor AS ta ON ta.title_id = t.title_id 
		JOIN authors AS a ON a.au_id = ta.au_id
		JOIN publishers AS p ON p.pub_id = t.pub_id
    GROUP BY a.au_id
    ORDER BY a.au_id DESC;


-- Challenge 3: Best Selling Authors --
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIST NAME',  SUM(s.qty) AS TOTAL
	FROM titles AS t
		JOIN titleauthor AS ta ON ta.title_id = t.title_id 
		JOIN authors AS a ON a.au_id = ta.au_id
		JOIN sales AS s ON s.title_id = t.title_id
    GROUP BY a.au_id
    ORDER BY TOTAL DESC LIMIT 3;


-- Challenge 4: Best Selling Authors Ranking --
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIST NAME',  IFNULL(SUM(s.qty), 0) AS TOTAL
	FROM authors AS a
		LEFT JOIN titleauthor AS ta ON a.au_id  = ta.au_id
		LEFT JOIN titles AS t ON t.title_id = ta.title_id 
		LEFT JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id
    ORDER BY TOTAL DESC;