CREATE TABLE vehicle_operators (
  id INTEGER NOT NULL,
  full_name VARCHAR(36),
  drivers_license_number VARCHAR(32),
  operator_signature VARCHAR(32),
  operator_status VARCHAR(32),
  parade_entry_id INTEGER,
  participating_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (parade_entry_id) REFERENCES parade_entries (parade_entry_id),
  FOREIGN KEY (participating_organization_id) REFERENCES participating_organizations (participating_organization_id)
);
