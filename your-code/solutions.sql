use publications;

-- CHALLENGE 1
select authors.au_id as "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname  AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" from titles

join titleauthor
	on titles.title_id = titleauthor.title_id

join authors
	on titleauthor.au_id = authors.au_id

join publishers
	on titles.pub_id = publishers.pub_id
order by authors.au_id 
;
-- Error Code: 1054. Unknown column 'authors.title_id' in 'on clause'

-- CHALLENGE 2
select authors.au_id as "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname  AS "FIRST NAME", publishers.pub_name AS "PUBLISHER",
 count(titles.title_id) as "TITLE COUNT" from titles

join titleauthor
	on titles.title_id = titleauthor.title_id

join authors
	on titleauthor.au_id = authors.au_id

join publishers
	on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by count(titles.title_id) desc
;


-- CH 3
select authors.au_id as "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname  AS "FIRST NAME", sum(sales.qty) as "TOTAL" from titles
join titleauthor
	on titles.title_id = titleauthor.title_id
join authors
	on titleauthor.au_id = authors.au_id
join sales 
	on titles.title_id = sales.title_id
group by authors.au_id
order by sum(sales.qty) desc
limit 3
;

-- CH4
select authors.au_id as "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname  AS "FIRST NAME", ifnull(sum(sales.qty),0) as "TOTAL" from authors
left join titleauthor
	on authors.au_id = titleauthor.au_id
left join sales
	on titleauthor.title_id = sales.title_id
group by authors.au_id
order by sum(sales.qty) desc
;

-- Error Code: 1054. Unknown column 'author.au_id' in 'on clause'
