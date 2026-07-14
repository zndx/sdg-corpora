CREATE TABLE evac_populations (
  id INTEGER NOT NULL,
  population_identifier VARCHAR(32),
  household_count INTEGER,
  average_household_size DECIMAL,
  evacuation_compliance_rate DECIMAL,
  transportation_access VARCHAR(32),
  geographic_zone_id INTEGER,
  warning_method_id INTEGER,
  evacuation_order_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES evac_geographic_zones (geographic_zone_id),
  FOREIGN KEY (warning_method_id) REFERENCES evac_warning_methods (warning_method_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evac_evacuation_orders (id)
);
