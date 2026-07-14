CREATE TABLE school_entities (
  id INTEGER NOT NULL,
  entity_id VARCHAR(44),
  entity_name VARCHAR(32),
  entity_type VARCHAR(32),
  parent_district VARCHAR(32),
  social_media_account_id INTEGER,
  district_employee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id)
);
