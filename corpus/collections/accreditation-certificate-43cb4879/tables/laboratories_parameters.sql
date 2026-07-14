CREATE TABLE laboratories_parameters (
  calibration_laboratory_id INTEGER NOT NULL,
  calibration_parameter_id INTEGER NOT NULL,
  PRIMARY KEY (calibration_laboratory_id, calibration_parameter_id),
  FOREIGN KEY (calibration_laboratory_id) REFERENCES calibration_laboratories (calibration_laboratory_id),
  FOREIGN KEY (calibration_parameter_id) REFERENCES calibration_parameters (calibration_parameter_id)
);
