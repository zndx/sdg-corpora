CREATE TABLE evac_evacuation_orders (
  id INTEGER NOT NULL,
  order_identifier VARCHAR(32),
  issuance_date_time TIMESTAMP,
  issuing_authority VARCHAR(32),
  evacuation_zone VARCHAR(32),
  hazard_type VARCHAR(32),
  status VARCHAR(32),
  mandatory BOOLEAN,
  hazard_event_id INTEGER,
  geographic_zone_id INTEGER,
  warning_method_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (hazard_event_id) REFERENCES evac_hazard_events (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES evac_geographic_zones (geographic_zone_id),
  FOREIGN KEY (warning_method_id) REFERENCES evac_warning_methods (warning_method_id)
);
