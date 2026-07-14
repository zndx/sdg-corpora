CREATE TABLE legislative_bodies (
  id INTEGER NOT NULL,
  body_name VARCHAR(32),
  jurisdiction_name VARCHAR(32),
  session_year INTEGER,
  status VARCHAR(32),
  act_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (act_number) REFERENCES legislative_acts (act_number)
);
