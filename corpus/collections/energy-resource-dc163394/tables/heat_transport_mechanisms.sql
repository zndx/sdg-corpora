CREATE TABLE heat_transport_mechanisms (
  heat_transport_mechanism_id INTEGER NOT NULL,
  mechanism_id VARCHAR(32),
  mechanism_type VARCHAR(32),
  transport_speed VARCHAR(32),
  recharge_rate DECIMAL,
  time_scale VARCHAR(32),
  energy_resource_id INTEGER,
  energy_extraction_id INTEGER,
  PRIMARY KEY (heat_transport_mechanism_id),
  FOREIGN KEY (energy_resource_id) REFERENCES energy_resources (id),
  FOREIGN KEY (energy_extraction_id) REFERENCES energy_extractions (id)
);
