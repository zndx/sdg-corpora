CREATE TABLE government_offices (
  government_office_id INTEGER NOT NULL,
  office_identifier VARCHAR(32),
  office_name VARCHAR(32),
  office_type VARCHAR(32),
  jurisdiction_level VARCHAR(32),
  is_responsible_for_standards BOOLEAN,
  standard_weight_or_measure_id INTEGER,
  secure_storage_facility_id INTEGER,
  weights_and_measures_function_id INTEGER,
  PRIMARY KEY (government_office_id),
  FOREIGN KEY (standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id),
  FOREIGN KEY (secure_storage_facility_id) REFERENCES secure_storage_facilities (id),
  FOREIGN KEY (weights_and_measures_function_id) REFERENCES weights_and_measures_functions (id)
);
