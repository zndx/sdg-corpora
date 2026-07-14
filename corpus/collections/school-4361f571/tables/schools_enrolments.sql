CREATE TABLE schools_enrolments (
  school_id INTEGER NOT NULL,
  enrolment_id INTEGER NOT NULL,
  PRIMARY KEY (school_id, enrolment_id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id)
);
