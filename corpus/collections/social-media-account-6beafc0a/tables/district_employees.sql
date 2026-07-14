CREATE TABLE district_employees (
  district_employee_id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  role VARCHAR(32),
  employment_status VARCHAR(32),
  contact_extension VARCHAR(32),
  social_media_account_id INTEGER,
  electronic_communication_id INTEGER,
  PRIMARY KEY (district_employee_id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (id),
  FOREIGN KEY (electronic_communication_id) REFERENCES electronic_communications (electronic_communication_id)
);
