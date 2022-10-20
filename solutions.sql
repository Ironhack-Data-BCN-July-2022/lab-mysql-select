#In this challenge you will write a MySQL SELECT query that joins various tables to
# figure out what titles each author has published at which publishers. Your output should have at least the following columns:

#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TITLE - name of the published title
#PUBLISHER - name of the publisher where the title was published


use publications;
select authors.au_id,au_fname,au_lname,title,pub_name
	from authors
	join titleauthor
	on authors.au_id=titleauthor.au_id
    join titles
    on titleauthor.title_id=titles.title_id
    join publishers
    on titles.pub_id=publishers.pub_id
    order by au_id;





#Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.
use publications;
select authors.au_id,au_fname,au_lname,count(title),pub_name
	from authors
	join titleauthor
	on authors.au_id=titleauthor.au_id
    join titles
    on titleauthor.title_id=titles.title_id
    join publishers
    on titles.pub_id=publishers.pub_id
    group by au_id,
	group by pub_name
    order by authors.au_id;
    
 Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group by pub_name     order by authors.au_id' at line 10


 
 Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

#Your output should have the following columns:
#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TOTAL - total number of titles sold from this author
#Your output should be ordered based on TOTAL from high to low.
#Only output the top 3 best selling authors.
select authors



    
    
    
