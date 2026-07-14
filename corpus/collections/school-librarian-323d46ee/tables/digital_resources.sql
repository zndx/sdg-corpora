CREATE TABLE digital_resources (
  digital_resource_id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  resource_type VARCHAR(32),
  access_level VARCHAR(32),
  cost DECIMAL,
  last_updated DATE,
  is_equitable BOOLEAN,
  library_program_id INTEGER,
  PRIMARY KEY (digital_resource_id),
  FOREIGN KEY (library_program_id) REFERENCES library_programs (library_program_id)
);
