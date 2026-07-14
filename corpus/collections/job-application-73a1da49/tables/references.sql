CREATE TABLE references (
  reference_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  address VARCHAR(32),
  phone VARCHAR(32),
  relationship_type VARCHAR(32),
  is_relative BOOLEAN,
  applicant_id INTEGER,
  PRIMARY KEY (reference_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id)
);
