CREATE TABLE no_contact_directives (
  id INTEGER NOT NULL,
  directive_id VARCHAR(40),
  issue_date TIMESTAMP,
  issuing_office VARCHAR(32),
  contact_type VARCHAR(32),
  status VARCHAR(32),
  dean_of_students_staff_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id)
);
