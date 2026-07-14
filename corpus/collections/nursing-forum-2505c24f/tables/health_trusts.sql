CREATE TABLE health_trusts (
  health_trust_id INTEGER NOT NULL,
  trust_id VARCHAR(44),
  trust_name VARCHAR(32),
  trust_type VARCHAR(32),
  region VARCHAR(32),
  cqc_rating VARCHAR(32),
  established_year INTEGER,
  clinical_outcome_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (health_trust_id),
  FOREIGN KEY (clinical_outcome_id) REFERENCES clinical_outcomes (clinical_outcome_id)
);
