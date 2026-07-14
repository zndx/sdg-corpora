CREATE TABLE electricity_meters (
  electricity_meter_id INTEGER NOT NULL,
  meter_id VARCHAR(44),
  installation_date DATE,
  meter_type VARCHAR(32),
  current_reading DECIMAL,
  last_calibration_date DATE,
  household_id INTEGER,
  PRIMARY KEY (electricity_meter_id),
  FOREIGN KEY (household_id) REFERENCES households (id)
);
