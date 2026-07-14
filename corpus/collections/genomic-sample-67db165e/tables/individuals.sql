CREATE TABLE individuals (
  id INTEGER NOT NULL,
  individual_id VARCHAR(44),
  date_of_birth DATE,
  sex VARCHAR(32),
  ethnicity VARCHAR(32),
  enrollment_date TIMESTAMP,
  status VARCHAR(32),
  record_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (record_id) REFERENCES health_records (record_id)
);
