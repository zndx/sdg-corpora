CREATE TABLE coaches (
  id INTEGER NOT NULL,
  coach_id VARCHAR(44),
  full_name VARCHAR(36),
  qualifications VARCHAR(32),
  years_experience INTEGER,
  specialization VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  professional_membership_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (professional_membership_id) REFERENCES professional_memberships (id)
);
