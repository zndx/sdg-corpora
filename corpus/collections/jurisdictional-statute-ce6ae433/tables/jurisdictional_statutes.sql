CREATE TABLE jurisdictional_statutes (
  id INTEGER NOT NULL,
  statute_identifier VARCHAR(32),
  enactment_date DATE,
  jurisdiction_name VARCHAR(32),
  status VARCHAR(32),
  subject_matter VARCHAR(32),
  jurisdictional_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdictional_statute_id) REFERENCES jurisdictional_statutes (id)
);
