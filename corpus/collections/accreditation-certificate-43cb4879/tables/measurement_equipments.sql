CREATE TABLE measurement_equipments (
  equipment_type VARCHAR(32),
  equipment_model VARCHAR(32),
  serial_number INTEGER NOT NULL,
  manufacturer VARCHAR(46),
  calibration_status VARCHAR(32),
  calibration_parameter_id INTEGER,
  calibration_laboratory_id INTEGER,
  PRIMARY KEY (serial_number),
  FOREIGN KEY (calibration_parameter_id) REFERENCES calibration_parameters (calibration_parameter_id),
  FOREIGN KEY (calibration_laboratory_id) REFERENCES calibration_laboratories (calibration_laboratory_id)
);
