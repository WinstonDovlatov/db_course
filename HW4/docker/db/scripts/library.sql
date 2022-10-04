CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.reader
(
    id      serial primary key,
    name    varchar,
    surname varchar,
    address varchar,
    DOB     date
);

CREATE TABLE library.take_book
(
    copy_id     int primary key,
    reader_id   int,
    return_date date,
    foreign key (reader_id) references library.reader
);

CREATE TABLE library.books
(
    ISBN              varchar primary key,
    year              int,
    title             varchar,
    author            varchar,
    n_pages           int,
    publisher_address varchar,
    publisher_name    varchar
);

CREATE TABLE library.category
(
    name            varchar primary key,
    parent_category varchar
);

CREATE TABLE library.copies
(
    copy_id serial primary key,
    shelf   int,
    ISBN    varchar,
    foreign key (copy_id) references library.take_book,
    foreign key (ISBN) references library.books
);


CREATE TABLE library.category_mapping
(
    ISBN          varchar,
    category_name varchar,

    foreign key (ISBN) references library.books,
    foreign key (category_name) references library.category
);