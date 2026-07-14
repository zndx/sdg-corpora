CREATE TABLE academic_researchers (
  id INTEGER NOT NULL,
  full_name VARCHAR(36),
  affiliation VARCHAR(32),
  email_address VARCHAR(32),
  role_at_event VARCHAR(32),
  is_fellow BOOLEAN,
  academic_session_id INTEGER,
  academic_institution_id INTEGER,
  steering_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_session_id) REFERENCES academic_sessions (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (steering_committee_id) REFERENCES steering_committees (steering_committee_id)
);
