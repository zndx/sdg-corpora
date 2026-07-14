CREATE TABLE participants (
  participant_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  email VARCHAR(32),
  registration_date TIMESTAMP,
  attendance_status VARCHAR(32),
  prior_knowledge_level VARCHAR(32),
  motivation_type_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (participant_id),
  FOREIGN KEY (motivation_type_id) REFERENCES motivation_types (id)
);
