-- Заполнение таблицы Жанры
INSERT INTO Genres(name) 
VALUES ('progressive rock'), ('punk rock'), ('hip-hop'), ('Disco'), ('contemporary R&B');

-- Заполнение таблицы Артисты
INSERT INTO artists (name) 
VALUES ('Pink Floyd'), ('Genesis'), ('Green Day'), ('The Offspring'), ('Eminem'), ('Rihanna'), 
('Modern Talking'), ('Мираж'), ('TLC'), ('Beyoncé'); 

-- Заполнение таблицы Альбомы
INSERT INTO albums  (title, "year") 
VALUES ('The Dark Side of the Moon', '1973'), ('Nursery Cryme', '1971'), ('American Idiot', '2020');
INSERT INTO albums  (title, "year") 
values  ('Smash', '1994'), ('Recovery', '2019'),('Anti', '2016');
INSERT INTO albums  (title, "year")
values ('Let’s Talk About Love', '1985'), ('Не в пе́рвый раз', '2018'), ('FanMail', '1999');
INSERT INTO albums  (title, "year")
values ('Dangerously in Love', '2003'); 
INSERT INTO albums  (title, "year")
values ('The Don Divas', '2009'); 

-- Заполнение связей между Артистами и Жанрами  
INSERT INTO artistgenre (artist_id, genre_id)
values (1, 1), (2, 1);
INSERT INTO artistgenre (artist_id, genre_id)
values (3, 2), (4, 2);
INSERT INTO artistgenre (artist_id, genre_id)
values (5, 3), (6, 3);
INSERT INTO artistgenre (artist_id, genre_id)
values (7, 4), (8, 4);
INSERT INTO artistgenre (artist_id, genre_id)
values (9, 5), (10, 5);						
INSERT INTO artistgenre (artist_id, genre_id)
values (6, 5), (10, 3);

-- Заполнение связей между Артистами и Альбомами 
INSERT INTO artistalbum  (artist_id, album_id)
values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8),(9, 9), (10, 10),(6, 11), (10, 11); 

-- Заполнение таблицы Треки
INSERT INTO tracks (title, duration, album_id)
values ('Speak to Me', 243, 1), ('Time', 411, 1), ('Breathe', 166, 1), ('On the Run', 306, 1);
INSERT INTO tracks (title, duration, album_id)
values ('The Musical Box', 639, 2), ('For Absent Friends', 192, 2), ('Seven Stones', 206, 2), ('Harold the Barrel', 175, 2);
INSERT INTO tracks (title, duration, album_id)
values ('American Idiot', 439, 3), ('Jesus of Suburbia', 292, 3), ('City of the Damned', 306, 3), ('Dearly Beloved', 375, 3);
INSERT INTO tracks (title, duration, album_id)
values ('Time to Relax', 25, 4), ('Nitro (Youth Energy)', 150, 4), ('Bad Habit', 223, 4), ('Gotta Get Away', 240, 4);
INSERT INTO tracks (title, duration, album_id)
VALUES ('Love the Way You Lie', 267, 5), ('Not Afraid', 198, 5), ('Cold Wind Blows', 203, 5), ('My Name Is', 340, 5);
INSERT INTO tracks (title, duration, album_id)
values ('Kiss It Better', 367, 6), ('Needed Me', 298, 6), ('Love on the Brain', 253, 6);
INSERT INTO tracks (title, duration, album_id)
values ('Cheri, Cheri Lady', 257, 7), ('You’re the Lady of My Heart', 398, 7), ('Why Did You Do It Just Tonight?', 453, 7);
INSERT INTO tracks (title, duration, album_id)
values ('Безумный мир', 185, 8), ('Я больше не прошy', 211, 8), ('Я снова вижу тебя', 244, 8);
INSERT INTO tracks (title, duration, album_id)
values ('I Miss You So Much', 247, 9), ('FanMail', 198, 9), ('Lovesick', 253, 9);
INSERT INTO tracks (title, duration, album_id)
values ('Crazy in Love', 235, 10), ('Me, Myself and I', 238, 10), ('Naughty Girl', 207, 10);
INSERT INTO tracks (title, duration, album_id)
values ('Bad Girl', 205, 11), ('Im Alone Now', 338, 11), ('Ice Cream', 237, 11);

-- Заполнение таблицы Сборники
INSERT INTO compilations (title, "year")
VALUES ('The Best of the Pink Floyd / Masters of Rock', '1970');
INSERT INTO compilations (title, "year")
VALUES ('I Can''t Dance Platinum Collection', '1991');
INSERT INTO compilations (title, "year")
values ('The Green Day Collection', '2009');
INSERT INTO compilations (title, "year")
values ('The Offspring Collection','1999');
INSERT INTO compilations (title, "year")
values ('Curtain Call: The Hits','2005');
INSERT INTO compilations (title, "year")
values ('Rated R: Remixed','2009');
INSERT INTO compilations (title, "year")
values ('The Final Album ','2003');
INSERT INTO compilations (title, "year")
values ('The Best of Greatest Hits','2000');
INSERT INTO compilations (title, "year")
values ('Playlist: The Very Best of TLC','2020');
INSERT INTO compilations (title, "year")
values ('Beyoncé Karaoke Hits, Vol. I','2019'); 

-- Заполнение связей между Треками  и Сборниками
INSERT INTO trackcompilation (track_id, compilation_id)
values (2, 1);
INSERT INTO trackcompilation (track_id, compilation_id)
values (4, 1);
INSERT INTO trackcompilation (track_id, compilation_id)
values (5, 2);
INSERT INTO trackcompilation (track_id, compilation_id)
values (8, 2);
INSERT INTO trackcompilation (track_id, compilation_id)
values (9, 3);
INSERT INTO trackcompilation (track_id, compilation_id)
values (12, 3);
INSERT INTO trackcompilation (track_id, compilation_id)
values (14, 4);
INSERT INTO trackcompilation (track_id, compilation_id)
values (16, 4);
INSERT INTO trackcompilation (track_id, compilation_id)
values (17, 5);
INSERT INTO trackcompilation (track_id, compilation_id)
values (20, 5);
INSERT INTO trackcompilation (track_id, compilation_id)
values (22, 6);
INSERT INTO trackcompilation (track_id, compilation_id)
values (23, 6);
INSERT INTO trackcompilation (track_id, compilation_id)
values (24, 7);
INSERT INTO trackcompilation (track_id, compilation_id)
values (25, 7);
INSERT INTO trackcompilation (track_id, compilation_id)
values (27, 8);
INSERT INTO trackcompilation (track_id, compilation_id)
values (29, 8);
INSERT INTO trackcompilation (track_id, compilation_id)
values (30, 9);
INSERT INTO trackcompilation (track_id, compilation_id)
values (32, 9);
INSERT INTO trackcompilation (track_id, compilation_id)
values (33, 10);
INSERT INTO trackcompilation (track_id, compilation_id)
values (34, 10);										
