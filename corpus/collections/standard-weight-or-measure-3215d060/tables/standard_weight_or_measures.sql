CREATE TABLE standard_weight_or_measures (
  id INTEGER NOT NULL,
  standard_identifier VARCHAR(32),
  certification_date DATE,
  last_certification_date DATE,
  next_certification_due_date DATE,
  storage_location VARCHAR(32),
  certification_status VARCHAR(32),
  standard_type VARCHAR(32),
  is_primary_standard BOOLEAN,
  secure_storage_facility_id INTEGER,
  certification_authority_id INTEGER,
  field_standard_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (secure_storage_facility_id) REFERENCES secure_storage_facilities (id),
  FOREIGN KEY (certification_authority_id) REFERENCES certification_authorities (id),
  FOREIGN KEY (field_standard_id) REFERENCES field_standards (id)
);
