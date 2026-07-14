CREATE TABLE spiritual_seekers (
  spiritual_seeker_id INTEGER NOT NULL,
  seeker_id VARCHAR(44),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  email_address VARCHAR(32),
  member_since TIMESTAMP,
  is_anonymous BOOLEAN,
  donation_id INTEGER,
  retreat_program_id INTEGER,
  spiritual_path_id INTEGER,
  PRIMARY KEY (spiritual_seeker_id),
  FOREIGN KEY (donation_id) REFERENCES donations (id),
  FOREIGN KEY (retreat_program_id) REFERENCES retreat_programs (id),
  FOREIGN KEY (spiritual_path_id) REFERENCES spiritual_paths (spiritual_path_id)
);
