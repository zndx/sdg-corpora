CREATE TABLE enrolments (
  enrolment_id INTEGER NOT NULL,
  application_date TIMESTAMP,
  year_group VARCHAR(32),
  status VARCHAR(32),
  child_id INTEGER,
  school_id INTEGER,
  PRIMARY KEY (enrolment_id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (school_id) REFERENCES schools (id)
);
