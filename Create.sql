-- Создание таблицы "Жанры"
CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY,       -- Идентификатор жанра (первичный ключ)
    name VARCHAR(60) NOT NULL UNIQUE  -- Обязательное уникальное название жанра
);
-- Создание таблицы "Артисты"
CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,       -- Идентификатор артиста (первичный ключ)
    name VARCHAR(80) NOT NULL UNIQUE  -- имя или псевдоним Артиста (уникальное, не должен быть пустым)
);
-- Создание таблицы "Альбомы"
CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,       -- Идентификатор альбома (первичный ключ)
    title VARCHAR(1000) NOT NULL, -- Название альбома до 1000 символов (не должен быть пустым). Альбом с самым длинным названием принадлежит английской рок-группе Chumbawamba 864 символа.
    year INT NOT NULL,  -- Год выпуска (не должен быть пустым)
    UNIQUE (title, year)  -- Уникальность альбома по названию и году
);

-- Создание таблицы "Треки"
CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,       -- Идентификатор трека (первичный ключ)
    title VARCHAR(150) NOT NULL, -- Название трека (не должен быть пустым)
    duration INT NOT NULL CHECK (duration > 0),  -- Длительность в секундах положительное число. (не должен быть пустым)
    album_id INT REFERENCES Albums(id) ON DELETE CASCADE  -- Ссылка на альбом,  если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
);

-- Создание таблицы "Сборники"
CREATE TABLE IF NOT EXISTS Compilations (
    id SERIAL PRIMARY KEY,       -- Идентификатор сборника
    title VARCHAR(1000) NOT NULL, -- Название сборника (не должен быть пустым)
    year INT NOT NULL --Год выпуска (не должен быть пустым)
);

-- Промежуточная таблица "Артисты-Жанры"
CREATE TABLE IF NOT EXISTS ArtistGenre (
   	artist_id INT REFERENCES Artists(id) ON DELETE CASCADE,  -- Ссылка на артиста, если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
	genre_id INT REFERENCES Genres(id) ON DELETE CASCADE,  -- Ссылка на жанр,  если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
    PRIMARY KEY (genre_id, artist_id)  -- Составной первичный ключ
);
-- Промежуточная таблица "Артисты-Альбомы"
CREATE TABLE IF NOT EXISTS ArtistAlbum (
    artist_id INT REFERENCES Artists(id) ON DELETE CASCADE,  -- Ссылка на артиста, если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
    album_id INT REFERENCES Albums(id) ON DELETE CASCADE,  -- Ссылка на альбом, если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
    PRIMARY KEY (artist_id, album_id)  -- Составной первичный ключ
);
-- Промежуточная таблица "Треки-Сборники"
CREATE TABLE IF NOT EXISTS TrackCompilation (
    track_id INT REFERENCES Tracks(id) ON DELETE CASCADE,  -- Ссылка на трек, если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
    compilation_id INT REFERENCES Compilations(id) ON DELETE CASCADE,  -- Ссылка на сборник, если запись в родительской таблице удаляется, то все связанные записи в дочерней таблице также удаляются
    PRIMARY KEY (track_id, compilation_id)  -- Составной первичный ключ
);
