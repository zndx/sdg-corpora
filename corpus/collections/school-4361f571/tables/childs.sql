CREATE TABLE childs (
  id INTEGER NOT NULL,
  full_legal_name VARCHAR(32),
  date_of_birth DATE,
  gender VARCHAR(32),
  permanent_address VARCHAR(32),
  permanent_postal_code VARCHAR(32),
  enrolment_id INTEGER,
  child_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id),
  FOREIGN KEY (child_id) REFERENCES childs (id)
);
