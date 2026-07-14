CREATE TABLE code_of_conducts (
  id INTEGER NOT NULL,
  document_id VARCHAR(44),
  title VARCHAR(32),
  effective_date DATE,
  version_number VARCHAR(32),
  approval_date DATE,
  issuing_body VARCHAR(32),
  interim_suspension_id INTEGER,
  no_contact_directive_id INTEGER,
  student_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (interim_suspension_id) REFERENCES interim_suspensions (id),
  FOREIGN KEY (no_contact_directive_id) REFERENCES no_contact_directives (id),
  FOREIGN KEY (student_activity_id) REFERENCES student_activities (id)
);
