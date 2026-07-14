CREATE TABLE institutions (
  institution_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  type VARCHAR(32),
  location VARCHAR(32),
  founded_date DATE,
  degree_id INTEGER,
  PRIMARY KEY (institution_id),
  FOREIGN KEY (degree_id) REFERENCES degrees (degree_id)
);
