USE publications;

-- Challenge 1

SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
JOIN publishers
ON titles.pub_id=publishers.pub_id;

-- Challenge 2

SELECT authors.au_id, au_lname, au_fname, pub_name, count(title)
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
JOIN publishers
ON titles.pub_id=publishers.pub_id
GROUP BY au_id;

-- Challenge 3: answering the question how many titles the author has written / sold

SELECT authors.au_id, au_lname, au_fname, count(title) as total_books
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY au_id
ORDER BY total_books DESC
LIMIT 3;

-- Challenge 4: showing the number of titles from every author, sorted by descending order

SELECT authors.au_id, au_lname, au_fname, count(title) as total_books
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
GROUP BY au_id
ORDER BY total_books DESC;

-- What Fer and Pau actually meant with challenge 3 :)

SELECT authors.au_id, au_lname, au_fname, sum(sales.qty) as total_books
FROM authors
JOIN titleauthor
ON authors.au_id=titleauthor.au_id
JOIN titles
ON titleauthor.title_id=titles.title_id
JOIN sales
ON titles.title_id=sales.title_id
GROUP BY au_id
ORDER BY total_books DESC
LIMIT 3;

-- What Fer and Pau actually meant with Challenge 4

SELECT authors.au_id, au_lname, au_fname, coalesce((sales.qty),0) as total_books
FROM authors
LEFT JOIN titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON titles.title_id=sales.title_id
GROUP BY au_id
ORDER BY total_books DESC;
