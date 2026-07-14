CREATE TABLE individuals (
  participant_id VARCHAR(44) NOT NULL,
  age INTEGER,
  sex VARCHAR(32),
  ethnicity VARCHAR(32),
  enrollment_date TIMESTAMP,
  consent_status VARCHAR(32),
  PRIMARY KEY (participant_id)
);
