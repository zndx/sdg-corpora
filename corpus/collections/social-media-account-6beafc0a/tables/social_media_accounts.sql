CREATE TABLE social_media_accounts (
  id INTEGER NOT NULL,
  account_identifier VARCHAR(32),
  platform VARCHAR(32),
  representing_entity VARCHAR(32),
  is_official BOOLEAN,
  registration_date TIMESTAMP,
  status VARCHAR(32),
  district_employee_id INTEGER,
  school_entity_id INTEGER,
  secure_credential_store_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id),
  FOREIGN KEY (school_entity_id) REFERENCES school_entities (id),
  FOREIGN KEY (secure_credential_store_id) REFERENCES secure_credential_stores (secure_credential_store_id)
);
