--authors columns - author_id, name, gender, birth_year
--books columns - book_id, title, genre, author_id

select * from authors

select * from books

--a) what is the number of books written by each author along with their gender

select a.name, a.gender, count(b.book_id) as "book_count" from books as b
inner join authors as a
on b.author_id = a.author_id
group by a.name, a.gender
order by count(b.book_id) 


--b) list all the books of mystery genre along with their author's names

select b.title as "book_name" , a.name as "author_name" from books as b
inner join authors as a
on b.author_id = a.author_id
where b.genre = 'mystery'

--c) what is the number of books along with authors name whose authors are born between 1980 and 1999

select a.name, a.birth_year, count(b.book_id) as "book_count" from books as b
inner join authors as a
on b.author_id = a.author_id
where a.birth_year between 1980 and 1999
group by a.name, a.birth_year

--d) what is the average number of books of the genre "horror" and "scifi" written by authors along with their gender

select a.name , a.gender , b.genre as "book_genre", avg(b.book_id) as "avg_no_of_books" from books as b
inner join authors as a
on b.author_id = a.author_id
where b.genre = 'horror' or b.genre = 'scifi'
group by a.name , a.gender , b.genre


