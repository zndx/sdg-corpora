CREATE TABLE administrative_units (
  id INTEGER NOT NULL,
  unit_id VARCHAR(44),
  unit_name VARCHAR(32),
  unit_type VARCHAR(32),
  established_date TIMESTAMP,
  is_shared_service BOOLEAN,
  jurisdiction_scope VARCHAR(32),
  role_id VARCHAR(44),
  stakeholder_group_id INTEGER,
  administrative_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES administrative_roles (role_id),
  FOREIGN KEY (stakeholder_group_id) REFERENCES stakeholder_groups (id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id)
);
