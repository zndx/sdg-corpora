CREATE TABLE journals (
  id INTEGER NOT NULL,
  journal_id VARCHAR(40),
  journal_name VARCHAR(32),
  issn VARCHAR(32),
  publisher VARCHAR(32),
  impact_factor DECIMAL,
  PRIMARY KEY (id)
);
