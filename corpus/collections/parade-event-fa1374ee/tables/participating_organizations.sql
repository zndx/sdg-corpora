CREATE TABLE participating_organizations (
  participating_organization_id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  contact_person_name VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  authorization_signature VARCHAR(32),
  submission_status VARCHAR(32),
  parade_entry_id INTEGER,
  vehicle_operator_id INTEGER,
  PRIMARY KEY (participating_organization_id),
  FOREIGN KEY (parade_entry_id) REFERENCES parade_entries (parade_entry_id),
  FOREIGN KEY (vehicle_operator_id) REFERENCES vehicle_operators (id)
);
