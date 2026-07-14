CREATE TABLE cyber_risk_scores (
  id INTEGER NOT NULL,
  score_value DECIMAL,
  risk_level VARCHAR(32),
  assessment_date TIMESTAMP,
  scoring_methodology VARCHAR(32),
  is_prioritized_for_response BOOLEAN,
  response_action VARCHAR(32),
  medical_device_model_number VARCHAR(32),
  cyber_threat_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (medical_device_model_number) REFERENCES medical_devices (model_number),
  FOREIGN KEY (cyber_threat_id) REFERENCES cyber_threats (id)
);
