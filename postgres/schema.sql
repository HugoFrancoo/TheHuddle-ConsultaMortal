DROP TABLE IF EXISTS author,author_book,category,books CASCADE;

CREATE TABLE author (
    id_author SERIAL PRIMARY KEY,
    author_name VARCHAR(100),
    birth_year SMALLINT,
    country VARCHAR(100),
    external_api_id VARCHAR(100),
    total_known_works INTEGER,
    api_source VARCHAR(100)
);

CREATE TABLE category (
    id_category INTEGER PRIMARY KEY,
    category_name VARCHAR(80)
);

CREATE TABLE books (
    id_book SERIAL PRIMARY KEY,
    id_category INTEGER NOT NULL,
    title VARCHAR(100),
    price NUMERIC(12,2),
    rating SMALLINT,
    CONSTRAINT fk_category FOREIGN KEY (id_category)
        REFERENCES category(id_category)
);

CREATE TABLE author_book(
    id_author_book SERIAL PRIMARY KEY,
    id_author INTEGER NOT NULL,
    id_book INTEGER NOT NULL,
    CONSTRAINT fk_author FOREIGN KEY (id_author)
        REFERENCES author(id_author),
    CONSTRAINT fk_book FOREIGN KEY (id_book)
        REFERENCES books(id_book)
);

