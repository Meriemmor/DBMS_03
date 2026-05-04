PRAGMA foreign_keys = ON;

CREATE TABLE book (
    isbn        TEXT PRIMARY KEY,
    title       TEXT NOT NULL,
    pub_year    INTEGER
);

CREATE TABLE author (
    author_id   INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    nationality TEXT
);

CREATE TABLE writes (
    author_id   INTEGER NOT NULL,
    isbn        TEXT    NOT NULL,
    PRIMARY KEY (author_id, isbn),
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (isbn)      REFERENCES book(isbn)        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE copy (
    copy_no     INTEGER PRIMARY KEY,
    isbn        TEXT    NOT NULL,
    shelf_loc   TEXT,
    FOREIGN KEY (isbn) REFERENCES book(isbn) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE member (
    member_no   INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    email       TEXT
);

CREATE TABLE loan (
    loan_id     INTEGER PRIMARY KEY,
    member_no   INTEGER NOT NULL,
    copy_no     INTEGER NOT NULL,
    loan_date   TEXT    NOT NULL,
    due_date    TEXT    NOT NULL,
    return_date TEXT,
    FOREIGN KEY (member_no) REFERENCES member(member_no) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (copy_no)   REFERENCES copy(copy_no)     ON DELETE RESTRICT ON UPDATE CASCADE
);sqlite3 library.db < schema.sql
sqlite3 library.db ".tables"

