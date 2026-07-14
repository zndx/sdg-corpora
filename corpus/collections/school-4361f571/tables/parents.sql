CREATE TABLE parents (
  id INTEGER NOT NULL,
  full_legal_name VARCHAR(32),
  relationship_to_child VARCHAR(32),
  home_telephone VARCHAR(32),
  mobile_telephone VARCHAR(32),
  work_telephone VARCHAR(32),
  email_address VARCHAR(32),
  residential_address VARCHAR(32),
  residential_postal_code INTEGER,
  child_id INTEGER,
  enrolment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id)
);
