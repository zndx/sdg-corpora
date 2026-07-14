CREATE TABLE household_members (
  member_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  ssn VARCHAR(32),
  role VARCHAR(32),
  age INTEGER,
  is_senior BOOLEAN,
  immigration_status_declaration_id INTEGER,
  housing_unit_id INTEGER,
  PRIMARY KEY (member_id),
  FOREIGN KEY (immigration_status_declaration_id) REFERENCES immigration_status_declarations (id),
  FOREIGN KEY (housing_unit_id) REFERENCES housing_units (id)
);
