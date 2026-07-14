CREATE TABLE officers (
  id INTEGER NOT NULL,
  officer_id INTEGER,
  full_name VARCHAR(36),
  role_title VARCHAR(32),
  appointment_date DATE,
  is_insurance_coordinator BOOLEAN,
  organization_id INTEGER,
  role_code VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (role_code) REFERENCES officer_roles (role_code)
);
