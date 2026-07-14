CREATE TABLE directives_students (
  no_contact_directive_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (no_contact_directive_id, student_id),
  FOREIGN KEY (no_contact_directive_id) REFERENCES no_contact_directives (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
