CREATE TABLE improper_conducts (
  id INTEGER NOT NULL,
  conduct_id VARCHAR(44),
  conduct_date TIMESTAMP,
  conduct_type VARCHAR(32),
  severity_level INTEGER,
  is_criminal BOOLEAN,
  description VARCHAR(32),
  disclosure_id INTEGER,
  investigation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (disclosure_id) REFERENCES protected_disclosures (disclosure_id),
  FOREIGN KEY (investigation_id) REFERENCES investigations (id)
);
