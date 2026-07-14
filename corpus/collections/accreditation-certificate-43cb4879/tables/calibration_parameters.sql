CREATE TABLE calibration_parameters (
  calibration_parameter_id INTEGER NOT NULL,
  parameter_name VARCHAR(32),
  measurement_range VARCHAR(32),
  expanded_uncertainty DECIMAL,
  uncertainty_unit VARCHAR(32),
  frequency_range VARCHAR(32),
  coverage_factor DECIMAL,
  calibration_laboratory_id INTEGER,
  calibration_standard_id INTEGER,
  PRIMARY KEY (calibration_parameter_id),
  FOREIGN KEY (calibration_laboratory_id) REFERENCES calibration_laboratories (calibration_laboratory_id),
  FOREIGN KEY (calibration_standard_id) REFERENCES calibration_standards (calibration_standard_id)
);
