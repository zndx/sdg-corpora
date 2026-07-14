CREATE TABLE academic_conferences (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location_city VARCHAR(32),
  location_country VARCHAR(32),
  status VARCHAR(32),
  academic_institution_id INTEGER,
  steering_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id),
  FOREIGN KEY (steering_committee_id) REFERENCES steering_committees (steering_committee_id)
);
