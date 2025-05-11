                            -- Задание 2

-- название и продолжительность самого длительного трека;
SELECT title, duration FROM tracks
WHERE duration = (select MAX(duration) FROM tracks);
                            
 -- название треков, продолжительность которых не менее 3,5 минуты
SELECT title
FROM tracks
WHERE duration >= 3.5 * 60;                           
  
-- названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title,  year from compilations
WHERE year >= 2018 and year <= 2020;

 -- исполнители, чье имя состоит из 1 слова
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

-- название треков, которые содержат слово "мой"/"my" без учета регистра.
SELECT title
FROM tracks
WHERE title ILIKE '%мой%' OR title ILIKE '%my%'



							--Задание 3

--количество исполнителей в каждом жанре

/*Выбираем строку name из таблицы genres с псевдонимом genres
Функция COUNT(ag.artist_id) подсчитывает количество записей artist_id для каждого жанра
результат подсчета получает псевдоним artist_count
К таблице жанров присоединяется таблица связей artistgenre (псевдоним ag)
Соединение происходит по полю id из таблицы жанров и genre_id из таблицы связей
Используется LEFT JOIN, чтобы включить все жанры, даже если у них нет связанных исполнителей 
**/
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count 
FROM genres g                                               -- таблице genres дается псевдоним g
LEFT JOIN artistgenre ag ON g.id = ag.genre_id
 /*Результаты группируются по названию жанра.
Что позволяет агрегировать данные для каждого жанра отдельно*/
GROUP BY g.name
ORDER BY artist_count DESC; -- Результаты сортируются по количеству исполнителей в убывающем порядке.

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(t.id) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020

-- средняя продолжительность треков по каждому альбому;
SELECT a.title AS album, AVG(t.duration) AS avg_duration
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title
ORDER BY avg_duration DESC;

-- все исполнители, которые не выпустили альбомы в 2020 году;
SELECT ar.name AS artist
FROM artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM artistalbum aa
    JOIN albums al ON aa.album_id = al.id
    WHERE al.year = 2020
);
-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT DISTINCT c.title AS compilation
FROM compilations c
JOIN trackcompilation tc ON c.id = tc.compilation_id
JOIN tracks t ON tc.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artistalbum aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Pink Floyd';

									-- Задание 4

-- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT DISTINCT a.title AS album
FROM albums a
JOIN artistalbum aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
JOIN (
    SELECT artist_id, COUNT(genre_id) AS genre_count
    FROM artistgenre
    GROUP BY artist_id
    HAVING COUNT(genre_id) > 1
) multi_genre ON ar.id = multi_genre.artist_id;

-- наименование треков, которые не входят в сборники;
SELECT t.title AS track
FROM tracks t
LEFT JOIN trackcompilation tc ON t.id = tc.track_id
WHERE tc.track_id IS NULL;

-- название исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT ar.name AS artist, t.title AS track, t.duration
FROM artists ar
JOIN artistalbum aa ON ar.id = aa.artist_id
JOIN albums a ON aa.album_id = a.id
JOIN tracks t ON a.id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

-- название альбомов, содержащих наименьшее количество треков.
SELECT a.title AS album, COUNT(t.id) AS track_count
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title
HAVING COUNT(t.id) = (
    SELECT COUNT(t.id) AS cnt
    FROM albums a
    JOIN tracks t ON a.id = t.album_id
    GROUP BY a.id
    ORDER BY cnt ASC
    LIMIT 1
);
