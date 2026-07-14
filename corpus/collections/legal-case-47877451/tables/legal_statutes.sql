CREATE TABLE legal_statutes (
  id INTEGER NOT NULL,
  statute_id INTEGER,
  title VARCHAR(32),
  enactment_year INTEGER,
  jurisdiction VARCHAR(32),
  section_number VARCHAR(32),
  status VARCHAR(32),
  legal_statute_id INTEGER,
  is_amended_by_legal_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id),
  FOREIGN KEY (is_amended_by_legal_statute_id) REFERENCES legal_statutes (id)
);
