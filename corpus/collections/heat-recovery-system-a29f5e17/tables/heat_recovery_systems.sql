CREATE TABLE heat_recovery_systems (
  id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  system_model VARCHAR(32),
  design_capacity DECIMAL,
  commissioning_date TIMESTAMP,
  delivery_mode VARCHAR(32),
  status VARCHAR(32),
  pulp_mill_id INTEGER,
  exhaust_stream_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pulp_mill_id) REFERENCES pulp_mills (id),
  FOREIGN KEY (exhaust_stream_id) REFERENCES exhaust_streams (id)
);
