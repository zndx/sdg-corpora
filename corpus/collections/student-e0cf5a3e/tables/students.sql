CREATE TABLE students (
  student_id VARCHAR(32) NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  email_address VARCHAR(32),
  enrollment_status VARCHAR(32),
  enrollment_year INTEGER,
  code_of_conduct_id INTEGER,
  interim_suspension_id INTEGER,
  no_contact_directive_id INTEGER,
  student_activity_id INTEGER,
  PRIMARY KEY (student_id),
  FOREIGN KEY (code_of_conduct_id) REFERENCES code_of_conducts (id),
  FOREIGN KEY (interim_suspension_id) REFERENCES interim_suspensions (id),
  FOREIGN KEY (no_contact_directive_id) REFERENCES no_contact_directives (id),
  FOREIGN KEY (student_activity_id) REFERENCES student_activities (id)
);
