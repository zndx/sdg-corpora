CREATE TABLE staffs_directives (
  dean_of_students_staff_id INTEGER NOT NULL,
  no_contact_directive_id INTEGER NOT NULL,
  PRIMARY KEY (dean_of_students_staff_id, no_contact_directive_id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id),
  FOREIGN KEY (no_contact_directive_id) REFERENCES no_contact_directives (id)
);
