CREATE TABLE energy_extractions (
  id INTEGER NOT NULL,
  extraction_id VARCHAR(32),
  extraction_date TIMESTAMP,
  extraction_method VARCHAR(32),
  extraction_rate DECIMAL,
  sustainability_status VARCHAR(32),
  capacity_installed DECIMAL,
  capacity_limited DECIMAL,
  energy_resource_id INTEGER,
  heat_transport_mechanism_id INTEGER,
  energy_output_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (energy_resource_id) REFERENCES energy_resources (id),
  FOREIGN KEY (heat_transport_mechanism_id) REFERENCES heat_transport_mechanisms (heat_transport_mechanism_id),
  FOREIGN KEY (energy_output_id) REFERENCES energy_outputs (energy_output_id)
);
