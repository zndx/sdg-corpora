CREATE TABLE investigations (
  id INTEGER NOT NULL,
  investigation_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  findings_summary VARCHAR(32),
  corrective_action_taken BOOLEAN,
  disclosure_id INTEGER,
  improper_conduct_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (disclosure_id) REFERENCES protected_disclosures (disclosure_id),
  FOREIGN KEY (improper_conduct_id) REFERENCES improper_conducts (id)
);
