-- 1. Завершить создание БД streaming.

CREATE DATABASE streaming;

USE streaming;

CREATE TABLE users (
  UserID INT PRIMARY KEY AUTO_INCREMENT,
  UserName VARCHAR(32),
  Country VARCHAR(32),
  IsBlocked BOOLEAN DEFAULT false,
  CreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE streams (
  StreamID INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(128),
  AuthorID VARCHAR(32),
  IsComplete BOOLEAN DEFAULT true,
  CreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reactions (
  ReactionID INT PRIMARY KEY AUTO_INCREMENT,
  Value VARCHAR(2),
  AuthorID VARCHAR(32),
  StreamID INT,
  CreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (StreamID) REFERENCES streams(StreamID)
);

CREATE TABLE donations (
  DonationID INT PRIMARY KEY AUTO_INCREMENT,
  AuthorID VARCHAR(32),
  StreamID INT,
  Amount FLOAT,
  CreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (StreamID) REFERENCES streams(StreamID)
);

-- 2. Наполнить каждую из таблиц БД streaming несколькими записями.

INSERT INTO users (UserName, Country) VALUES 
('John Smith', 'USA'),
('Emma Davis', 'Canada'),
('Juan Rodriguez', 'Mexico'),
('Hans Müller', 'Germany'),
('Sophie Dupont', 'France'),
('Giovanni Rossi', 'Italy'),
('Maria Hernandez', 'Spain'),
('Katarzyna Nowak', 'Poland'),
('Johan Andersson', 'Sweden'),
('Li Wei', 'China');

INSERT INTO streams (Title, AuthorID) VALUES
('Как приготовить идеальный омлет', 4),
('Исследование Канадских Роки', 6),
('Рецепт такос аль пастор', 7),
('Опыт Баварского пивного фестиваля', 9),
('Мастер-класс по французской выпечке', 8),
('Рецепт пасты карбонара', 5),
('Курс по испанскому языку для начинающих', 3),
('Рецепт польских пирогов пьероги', 4),
('Шведский мидсоммар', 6),
('Урок китайской каллиграфии', 7);

INSERT INTO reactions (Value, AuthorID, StreamID) 
VALUES 
('-1', 4, 7),
('+2', 2, 3),
('-3', 9, 5),
('+4', 6, 2),
('-2', 8, 1),
('+1', 1, 10),
('+3', 5, 9),
('-4', 10, 6),
('-1', 3, 4),
('+2', 7, 8);

INSERT INTO donations (AuthorID, StreamID, Amount)
VALUES
('5', 6, 120.5),
('2', 3, 50.0),
('8', 5, 85.3),
('4', 6, 25.8),
('9', 2, 300.0),
('10', 4, 12.6),
('1', 6, 150.9),
('7', 3, 75.2),
('3', 5, 200.7),
('6', 2, 5.1);

-- 3. Вывести данные о стримах (проекция: названиестрима, имяавтора_стрима)

SELECT
    streams.Title,
    users.UserName
FROM
      streams 
JOIN
       users ON
       streams.AuthorID = users.UserID;

-- 4. Вывести юзеров, у которых отсутствуют стримы.

SELECT
       *
 FROM
       users
 LEFT JOIN
       streams ON
       users.user_id = streams.author_id
 WHERE
       streams.author_id IS NULL;
