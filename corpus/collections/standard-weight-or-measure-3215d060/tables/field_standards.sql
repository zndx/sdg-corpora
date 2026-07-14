CREATE TABLE field_standards (
  id INTEGER NOT NULL,
  field_standard_identifier VARCHAR(32),
  verification_date DATE,
  verification_status VARCHAR(32),
  usage_context VARCHAR(32),
  is_portable BOOLEAN,
  last_calibration_date DATE,
  standard_weight_or_measure_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id)
);
