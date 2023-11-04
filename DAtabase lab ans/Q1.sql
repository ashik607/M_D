use pubs
--1
SELECT * 
FROM authors 
WHERE state IN ('CA', 'KS');
select *from authors

--2
USE pubs;
SELECT t.title, t.type
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title, t.type
HAVING SUM(s.qty) < 10000
ORDER BY t.title ASC;

--3 
USE pubs;

SELECT t.type, MAX(t.price) AS max_price, SUM(s.qty) AS total_yearly_sales
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.type
ORDER BY t.type ASC;

--4
USE pubs;
SELECT a.au_lname, a.au_fname
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
WHERE t.royalty = (SELECT MAX(royalty) FROM titles);
 
--5
USE pubs;

SELECT a.au_lname AS author_last_name, a.city AS author_city,
       p.pub_name AS publisher_name, p.city AS publisher_city
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
JOIN publishers p ON t.pub_id = p.pub_id
WHERE a.city <> p.city;

