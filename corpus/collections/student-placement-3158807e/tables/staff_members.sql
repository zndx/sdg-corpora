CREATE TABLE staff_members (
  staff_member_id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  employment_status VARCHAR(32),
  staff_professional_development_training_id VARCHAR(44),
  PRIMARY KEY (staff_member_id),
  FOREIGN KEY (staff_professional_development_training_id) REFERENCES staff_professional_developments (training_id)
);
