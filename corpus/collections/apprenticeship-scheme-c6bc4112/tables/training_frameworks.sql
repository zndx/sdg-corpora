CREATE TABLE training_frameworks (
  id INTEGER NOT NULL,
  framework_id VARCHAR(44),
  title VARCHAR(32),
  version VARCHAR(32),
  last_updated TIMESTAMP,
  competency_count INTEGER,
  scheme_id VARCHAR(44),
  qualification_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (qualification_id) REFERENCES qualifications (qualification_id)
);
