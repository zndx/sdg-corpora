CREATE TABLE protected_disclosures (
  disclosure_id INTEGER NOT NULL,
  disclosure_date TIMESTAMP,
  disclosure_method VARCHAR(32),
  is_good_faith BOOLEAN,
  subject_matter VARCHAR(32),
  retaliation_status VARCHAR(32),
  whistleblower_id INTEGER,
  investigation_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (disclosure_id),
  FOREIGN KEY (whistleblower_id) REFERENCES whistleblowers (whistleblower_id),
  FOREIGN KEY (investigation_id) REFERENCES investigations (id)
);
