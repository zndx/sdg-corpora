CREATE TABLE enrollees_enrolments (
  enrollee_id INTEGER NOT NULL,
  enrolment_id INTEGER NOT NULL,
  PRIMARY KEY (enrollee_id, enrolment_id),
  FOREIGN KEY (enrollee_id) REFERENCES enrollees (enrollee_id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id)
);
