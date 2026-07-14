CREATE TABLE persons (
  person_id VARCHAR(32) NOT NULL,
  legal_name VARCHAR(32),
  date_of_birth DATE,
  jurisdiction VARCHAR(32),
  vulnerable_status BOOLEAN,
  best_interest_determination_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
