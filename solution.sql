USE PUBLICATIONS;

# 1
SELECT authors.au_id as `Author ID`, authors.au_lname as `last name`, authors.au_fname as `first name`, titles.title as Title, pub_name as Publisher
	from titles
    left join titleauthor
		on titles.title_id = titleauthor.title_id
	left join authors
		ON  titleauthor.au_id = authors.au_id
	left join publishers
		on titles.pub_id = publishers.pub_id;

#2
SELECT authors.au_id as `Author ID`, authors.au_lname as `last name`, authors.au_fname as `first name`, pub_name as Publisher, count(titles.title) as "Title Count"
	from titles
    left join titleauthor
		on titles.title_id = titleauthor.title_id
	left join authors
		ON  titleauthor.au_id = authors.au_id
	left join publishers
		on titles.pub_id = publishers.pub_id
	Group by `Author ID`, Publisher;

#3
SELECT authors.au_id as `Author ID`, authors.au_lname as `last name`, authors.au_fname as `first name`, pub_name as Publisher, sum(titles.ytd_sales) as "TOTAL"
	from titles
    left join titleauthor
		on titles.title_id = titleauthor.title_id
	left join authors
		ON  titleauthor.au_id = authors.au_id
	left join publishers
		on titles.pub_id = publishers.pub_id
	Group by `Author ID`
    ORDER by sum(titles.ytd_sales) DESC
    LIMIT 500;

#4
SELECT authors.au_id as `Author ID`, authors.au_lname as `last name`, authors.au_fname as `first name`, pub_name as Publisher, ifnull(sum(titles.ytd_sales),0) as "TOTAL"
	from titles
    left join titleauthor
		on titles.title_id = titleauthor.title_id
	left join authors
		ON  titleauthor.au_id = authors.au_id
	join publishers
		on titles.pub_id = publishers.pub_id
	Group by `Author ID`
    ORDER by sum(titles.ytd_sales) DESC
    LIMIT 25;
