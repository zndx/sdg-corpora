CREATE TABLE executive_roles (
  executive_role_id INTEGER NOT NULL,
  role_identifier VARCHAR(32),
  role_title VARCHAR(32),
  department VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  employment_status VARCHAR(32),
  professional_id INTEGER,
  business_unit_id INTEGER,
  corporate_responsibility_programme_id INTEGER,
  PRIMARY KEY (executive_role_id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (business_unit_id),
  FOREIGN KEY (corporate_responsibility_programme_id) REFERENCES corporate_responsibility_programmes (id)
);
