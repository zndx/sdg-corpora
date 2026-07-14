CREATE TABLE journals (
  journal_id INTEGER NOT NULL,
  journal_name VARCHAR(32),
  issn VARCHAR(32),
  is_international BOOLEAN,
  impact_factor DECIMAL,
  publication_id INTEGER,
  PRIMARY KEY (journal_id),
  FOREIGN KEY (publication_id) REFERENCES publications (id)
);
