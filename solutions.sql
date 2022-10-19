use publications; 

-- Q1 
select titleauthor.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
from titleauthor
left join authors on titleauthor.au_id = authors.au_id 
left join titles on titleauthor.title_id = titles.title_id
left join publishers on titles.pub_id = publishers.pub_id
order by au_id;

-- Q2
SELECT authors.au_id as Author_id, au_lname as lastname, au_fname as firstname, publishers.pub_name as publisher , count(titles.title) as TITLE_COUNT
from titles
join titleauthor on titles.title_id = titleauthor.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on titles.pub_id= publishers.pub_id
group by Author_id, publisher
order by authors.au_id DESC;

-- Q3
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
FROM titles
LEFT JOIN titleauthor ON titles.title_id = titleauthor.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sum(sales.qty) DESC
LIMIT 3;

-- Q4
SELECT authors.au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, IFNULL(sum(sales.qty), 0) as TOTAL
FROM authors
LEFT JOIN titleauthor ON  authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
