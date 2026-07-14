CREATE TABLE universities (
  id INTEGER NOT NULL,
  university_id VARCHAR(40),
  university_name VARCHAR(32),
  legal_name VARCHAR(32),
  establishment_date TIMESTAMP,
  status VARCHAR(32),
  campus_location VARCHAR(32),
  total_campus_area_acres DECIMAL,
  funding_source VARCHAR(32),
  accreditation_body VARCHAR(32),
  accreditation_status VARCHAR(32),
  PRIMARY KEY (id)
);
