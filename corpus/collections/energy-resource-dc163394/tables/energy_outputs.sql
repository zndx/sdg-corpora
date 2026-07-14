CREATE TABLE energy_outputs (
  energy_output_id INTEGER NOT NULL,
  output_id VARCHAR(44),
  output_date TIMESTAMP,
  energy_quantity DECIMAL,
  unit VARCHAR(32),
  conversion_type VARCHAR(32),
  sustainability_limit DECIMAL,
  energy_extraction_id INTEGER,
  energy_resource_id INTEGER,
  PRIMARY KEY (energy_output_id),
  FOREIGN KEY (energy_extraction_id) REFERENCES energy_extractions (id),
  FOREIGN KEY (energy_resource_id) REFERENCES energy_resources (id)
);
