CREATE TABLE participating_organizations (
  participating_organization_id INTEGER NOT NULL,
  organization_id VARCHAR(40),
  legal_name VARCHAR(32),
  organization_type VARCHAR(32),
  registration_date TIMESTAMP,
  contact_person VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  enrollment_status VARCHAR(32),
  festival_enrollment_id INTEGER,
  festival_stall_id INTEGER,
  PRIMARY KEY (participating_organization_id),
  FOREIGN KEY (festival_enrollment_id) REFERENCES festival_enrollments (id),
  FOREIGN KEY (festival_stall_id) REFERENCES festival_stalls (festival_stall_id)
);
