CREATE TABLE employees (
  employee_id INTEGER NOT NULL,
  employee_name VARCHAR(32),
  department VARCHAR(32),
  years_employed INTEGER,
  feedback_submitted BOOLEAN,
  professionalism_rating DECIMAL,
  teamwork_rating DECIMAL,
  organization_id INTEGER,
  workplace_survey_id INTEGER,
  client_sector_id INTEGER,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (workplace_survey_id) REFERENCES workplace_surveys (id),
  FOREIGN KEY (client_sector_id) REFERENCES client_sectors (id)
);
