CREATE TABLE participants (
  participant_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email VARCHAR(32),
  registration_date TIMESTAMP,
  attendance_status VARCHAR(32),
  prior_knowledge_level VARCHAR(32),
  PRIMARY KEY (participant_id)
);
