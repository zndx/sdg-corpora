CREATE TABLE learning_environments (
  learning_environment_id INTEGER NOT NULL,
  environment_id INTEGER,
  safety_level VARCHAR(32),
  noise_level DECIMAL,
  lighting_condition VARCHAR(32),
  temperature DECIMAL,
  is_secure BOOLEAN,
  workshop_session_id INTEGER,
  group_agreement_id INTEGER,
  PRIMARY KEY (learning_environment_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (id),
  FOREIGN KEY (group_agreement_id) REFERENCES group_agreements (group_agreement_id)
);
