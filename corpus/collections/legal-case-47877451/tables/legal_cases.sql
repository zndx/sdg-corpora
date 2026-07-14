CREATE TABLE legal_cases (
  id INTEGER NOT NULL,
  case_identifier VARCHAR(32),
  court_name VARCHAR(32),
  case_type VARCHAR(32),
  year_filed INTEGER,
  status VARCHAR(32),
  judgment_date DATE,
  citation VARCHAR(32),
  judgment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (judgment_id) REFERENCES judgments (id)
);
