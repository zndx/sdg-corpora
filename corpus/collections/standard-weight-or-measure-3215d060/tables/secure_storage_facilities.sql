CREATE TABLE secure_storage_facilities (
  id INTEGER NOT NULL,
  facility_identifier VARCHAR(32),
  facility_name VARCHAR(32),
  location_description VARCHAR(32),
  security_level VARCHAR(32),
  access_control_policy VARCHAR(32),
  is_authorized_for_removal BOOLEAN,
  standard_weight_or_measure_id INTEGER,
  government_office_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id),
  FOREIGN KEY (government_office_id) REFERENCES government_offices (government_office_id)
);
