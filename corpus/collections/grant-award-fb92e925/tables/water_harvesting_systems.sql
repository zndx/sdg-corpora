CREATE TABLE water_harvesting_systems (
  water_harvesting_system_id INTEGER NOT NULL,
  system_type VARCHAR(32),
  capacity_liters DECIMAL,
  installation_date DATE,
  material_type VARCHAR(32),
  system_status VARCHAR(32),
  manufacturer VARCHAR(46),
  facility_id INTEGER,
  corporate_sponsor_id INTEGER,
  PRIMARY KEY (water_harvesting_system_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (facility_id),
  FOREIGN KEY (corporate_sponsor_id) REFERENCES corporate_sponsors (id)
);
