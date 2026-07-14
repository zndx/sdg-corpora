CREATE TABLE schools (
  school_id INTEGER NOT NULL,
  school_code VARCHAR(44),
  school_name VARCHAR(32),
  allocated_places INTEGER,
  office_location VARCHAR(32),
  website_url VARCHAR(55),
  discretionary_place_application_id INTEGER,
  admission_committee_id INTEGER,
  PRIMARY KEY (school_id),
  FOREIGN KEY (discretionary_place_application_id) REFERENCES discretionary_place_applications (discretionary_place_application_id),
  FOREIGN KEY (admission_committee_id) REFERENCES admission_committees (id)
);
