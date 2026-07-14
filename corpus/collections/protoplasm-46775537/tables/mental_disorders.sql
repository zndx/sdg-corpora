CREATE TABLE mental_disorders (
  id INTEGER NOT NULL,
  disorder_id VARCHAR(44),
  disorder_name VARCHAR(32),
  severity DECIMAL,
  onset_date TIMESTAMP,
  treatment_status VARCHAR(32),
  human_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (human_id) REFERENCES humans (id)
);
