CREATE TABLE social_media_accounts (
  social_media_account_id INTEGER NOT NULL,
  account_identifier VARCHAR(32),
  platform_type VARCHAR(32),
  registration_status VARCHAR(32),
  creation_date TIMESTAMP,
  last_audit_date TIMESTAMP,
  district_employee_id INTEGER,
  school_district_entity_id INTEGER,
  board_policy_id INTEGER,
  PRIMARY KEY (social_media_account_id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id),
  FOREIGN KEY (school_district_entity_id) REFERENCES school_district_entities (school_district_entity_id),
  FOREIGN KEY (board_policy_id) REFERENCES board_policies (id)
);
