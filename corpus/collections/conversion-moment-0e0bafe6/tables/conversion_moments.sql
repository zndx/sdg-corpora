CREATE TABLE conversion_moments (
  id INTEGER NOT NULL,
  moment_id VARCHAR(44),
  encounter_date TIMESTAMP,
  impact_description VARCHAR(32),
  response_action VARCHAR(32),
  is_dramatic BOOLEAN,
  physician_id VARCHAR(32),
  reference_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (physician_id) REFERENCES divine_physicians (physician_id),
  FOREIGN KEY (reference_id) REFERENCES scriptural_references (reference_id)
);
