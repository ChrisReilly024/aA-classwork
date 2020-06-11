DROP TABLE IF EXISTS question_tags;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;  -- turn on the foreign key constraints to ensure data integrity

-- USERS


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Ned", "Ruggeri"), ("Kush", "Patel"), ("Earl", "Cat");


-- QUESTIONS


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, author_id)
SELECT
  "Ned Question", "NED NED NED", 1
FROM
  users
WHERE
  users.fname = "Ned" AND users.lname = "Ruggeri";

INSERT INTO
  questions (title, body, author_id)
SELECT
  "Kush Question", "KUSH KUSH KUSH", users.id
FROM
  users
WHERE
  users.fname = "Kush" AND users.lname = "Patel";

INSERT INTO
  questions (title, body, author_id)
SELECT
  "Earl Question", "MEOW MEOW MEOW", users.id
FROM
  users
WHERE
  users.fname = "Earl" AND users.lname = "Cat";


-- QUESTION_FOLLOWS

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Ned" AND lname = "Ruggeri"),
  (SELECT id FROM questions WHERE title = "Earl Question")),

  ((SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
  (SELECT id FROM questions WHERE title = "Earl Question")
);


-- REPLIES


CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
  replies (question_id, parent_reply_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "Earl Question"),
  NULL,
  (SELECT id FROM users WHERE fname = "Ned" AND lname = "Ruggeri"),
  "Did you say NOW NOW NOW?"
);

INSERT INTO
  replies (question_id, parent_reply_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = "Earl Question"),
  (SELECT id FROM replies WHERE body = "Did you say NOW NOW NOW?"),
  (SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
  "I think he said MEOW MEOW MEOW."
);


-- QUESTION_LIKES


CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
  (SELECT id FROM questions WHERE title = "Earl Question")
);

-- and here is the lazy way to add some seed data:
INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);
INSERT INTO question_likes (user_id, question_id) VALUES (1, 2);










-- PRAGMA foreign_keys = ON;
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS questions;
-- DROP TABLE IF EXISTS question_follows;
-- DROP TABLE IF EXISTS replies;
-- DROP TABLE IF EXISTS question_likes;

-- CREATE TABLE users (
--     id INTEGER PRIMARY KEY,
--     fname TEXT,
--     lname TEXT,    
--     question_id INTEGER,

--     FOREIGN KEY (question_id) REFERENCES questions(id)
-- );

-- INSERT INTO
--   users (fname, lname)
-- VALUES
--   ("Ned", "Ruggeri"), ("Kush", "Patel"), ("Earl", "Cat");



-- CREATE TABLE questions (
--     id INTEGER PRIMARY KEY,
--     title TEXT,
--     body TEXT,
--     author_id INTEGER,

--     FOREIGN KEY (author_id) REFERENCES users(id)
-- );

-- INSERT INTO
--   questions (title, body, author_id)
-- SELECT
--   "Ned Question", "NED NED NED", 1
-- FROM
--   users
-- WHERE
--   users.fname = "Ned" AND users.lname = "Ruggeri";

-- INSERT INTO
--   questions (title, body, author_id)
-- SELECT
--   "Kush Question", "KUSH KUSH KUSH", users.id
-- FROM
--   users
-- WHERE
--   users.fname = "Kush" AND users.lname = "Patel";

-- INSERT INTO
--   questions (title, body, author_id)
-- SELECT
--   "Earl Question", "MEOW MEOW MEOW", users.id
-- FROM
--   users
-- WHERE
--   users.fname = "Earl" AND users.lname = "Cat";

-- CREATE TABLE question_follows (
--     id INTEGER PRIMARY KEY,
--     user_id INTEGER,
--     question_id INTEGER,

--     FOREIGN KEY (user_id) REFERENCES users(id),
--     FOREIGN KEY (question_id) REFERENCES questions(id)
-- );

-- INSERT INTO
--   question_follows (user_id, question_id)
-- VALUES
--   ((SELECT id FROM users WHERE fname = "Ned" AND lname = "Ruggeri"),
--   (SELECT id FROM questions WHERE title = "Earl Question")),

--   ((SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
--   (SELECT id FROM questions WHERE title = "Earl Question")
-- );

-- CREATE TABLE replies (
--     id INTEGER PRIMARY KEY,
--     question_id INTEGER,
--     parent_reply_id INTEGER,
--     user_id INTEGER,
--     reply TEXT,

--     FOREIGN KEY (question_id) REFERENCES questions(id),
--     FOREIGN KEY (user_id) REFERENCES users(id)

-- );

-- INSERT INTO
--   replies (question_id, parent_reply_id, user_id, reply)
-- VALUES
--   ((SELECT id FROM questions WHERE title = "Earl Question"),
--   NULL,
--   (SELECT id FROM users WHERE fname = "Ned" AND lname = "Ruggeri"),
--   "Did you say NOW NOW NOW?"
-- );

-- INSERT INTO
--   replies (question_id, parent_reply_id, user_id, reply)
-- VALUES
--   ((SELECT id FROM questions WHERE title = "Earl Question"),
--   (SELECT id FROM replies WHERE body = "Did you say NOW NOW NOW?"),
--   (SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
--   "I think he said MEOW MEOW MEOW."
-- );


-- CREATE TABLE question_likes (
--     id INTEGER PRIMARY KEY,
--     user_id INTEGER,
--     question_id INTEGER,

--     FOREIGN KEY (question_id) REFERENCES questions(id),
--     FOREIGN KEY (user_id) REFERENCES users(id)
    
-- );

-- INSERT INTO
--   question_likes (user_id, question_id)
-- VALUES
--   ((SELECT id FROM users WHERE fname = "Kush" AND lname = "Patel"),
--   (SELECT id FROM questions WHERE title = "Earl Question")
-- );

-- -- and here is the lazy way to add some seed data:
-- INSERT INTO question_likes (user_id, question_id) VALUES (1, 1);
-- INSERT INTO question_likes (user_id, question_id) VALUES (1, 2);
-- INSERT INTO 




    -- users (fname, lname)
    
-- VALUES
--     ('John', 'Doe'),
--     ('Jane', 'Doe1');

-- INSERT INTO 
--     questions (title, body, author_id)
-- VALUES
--     ('big o', 'worst case', (SELECT users.id FROM users WHERE fname = 'John')),
--     ('big o2', 'worst case', (SELECT users.id FROM users WHERE fname = 'Jane'));

-- INSERT INTO 
--     question_follows(user_id, question_id)
-- VALUES
--     ((SELECT id FROM questions WHERE title = 'big o'), 
--     (SELECT id FROM users WHERE fname = "John")),    
    
--     ((SELECT id FROM questions WHERE title = 'big o2'), 
--     (SELECT id FROM users WHERE fname = "Jane"))


-- INSERT INTO 
--     replies(question_id, user_id, reply, parent_reply)
-- VALUES
--     (1,  
--     (SELECT id FROM users WHERE fname = "John")),    

    
--     ((SELECT id FROM questions WHERE title = 'big o2'), 
--     (SELECT id FROM users WHERE fname = "Jane"))

-- -- cat import_db.sql | sqlite3 questions.db