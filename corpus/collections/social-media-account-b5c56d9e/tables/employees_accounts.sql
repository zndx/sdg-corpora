CREATE TABLE employees_accounts (
  district_employee_id INTEGER NOT NULL,
  social_media_account_id INTEGER NOT NULL,
  PRIMARY KEY (district_employee_id, social_media_account_id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (social_media_account_id)
);
