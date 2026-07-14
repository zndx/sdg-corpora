CREATE TABLE organizations (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  founded_year INTEGER,
  annual_revenue VARCHAR(32),
  employee_count INTEGER,
  volunteer_count INTEGER,
  location VARCHAR(32),
  is_nonprofit BOOLEAN,
  facility_id INTEGER,
  donor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id),
  FOREIGN KEY (donor_id) REFERENCES donors (id)
);
