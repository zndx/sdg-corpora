CREATE TABLE didactic_instruments (
  id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  title VARCHAR(32),
  type VARCHAR(32),
  publication_year INTEGER,
  author_name VARCHAR(32),
  is_digital BOOLEAN,
  situation_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (situation_id) REFERENCES didactical_situations (situation_id)
);
