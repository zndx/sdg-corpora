CREATE TABLE electronic_communications (
  electronic_communication_id INTEGER NOT NULL,
  communication_id VARCHAR(34),
  content_type VARCHAR(32),
  sent_date_time TIMESTAMP,
  is_public_record BOOLEAN,
  platform_used VARCHAR(32),
  content_status VARCHAR(32),
  district_employee_id INTEGER,
  school_entity_id INTEGER,
  PRIMARY KEY (electronic_communication_id),
  FOREIGN KEY (district_employee_id) REFERENCES district_employees (district_employee_id),
  FOREIGN KEY (school_entity_id) REFERENCES school_entities (id)
);
