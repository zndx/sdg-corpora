CREATE TABLE evac_warning_methods (
  warning_method_id INTEGER NOT NULL,
  method_identifier VARCHAR(32),
  method_name VARCHAR(32),
  reach VARCHAR(32),
  reliability VARCHAR(32),
  active_during_power_outage BOOLEAN,
  evacuation_order_id INTEGER,
  population_id INTEGER,
  PRIMARY KEY (warning_method_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evac_evacuation_orders (id),
  FOREIGN KEY (population_id) REFERENCES evac_populations (id)
);
