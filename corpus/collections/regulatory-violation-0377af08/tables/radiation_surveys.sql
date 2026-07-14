CREATE TABLE radiation_surveys (
  id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  survey_date TIMESTAMP,
  area_type VARCHAR(32),
  measured_dose_rate DECIMAL,
  unit_of_measure VARCHAR(32),
  compliance_status VARCHAR(32),
  licensee_id INTEGER,
  regulatory_violation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (licensee_id) REFERENCES licensees (id),
  FOREIGN KEY (regulatory_violation_id) REFERENCES regulatory_violations (regulatory_violation_id)
);
