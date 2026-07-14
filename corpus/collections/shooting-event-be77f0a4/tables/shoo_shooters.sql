CREATE TABLE shoo_shooters (
  id INTEGER NOT NULL,
  shooter_id VARCHAR(32),
  first_name VARCHAR(36),
  last_name VARCHAR(32),
  nationality VARCHAR(32),
  gender VARCHAR(32),
  birth_date DATE,
  PRIMARY KEY (id)
);
