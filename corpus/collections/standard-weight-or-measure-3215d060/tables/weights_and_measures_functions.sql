CREATE TABLE weights_and_measures_functions (
  id INTEGER NOT NULL,
  function_identifier VARCHAR(32),
  function_name VARCHAR(32),
  function_status VARCHAR(32),
  transfer_date DATE,
  original_responsible_office VARCHAR(32),
  current_responsible_office VARCHAR(32),
  government_office_id INTEGER,
  standard_weight_or_measure_id INTEGER,
  field_standard_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (government_office_id) REFERENCES government_offices (government_office_id),
  FOREIGN KEY (standard_weight_or_measure_id) REFERENCES standard_weight_or_measures (id),
  FOREIGN KEY (field_standard_id) REFERENCES field_standards (id)
);
