CREATE TABLE energy_resources (
  id INTEGER NOT NULL,
  resource_identifier VARCHAR(32),
  resource_name VARCHAR(32),
  renewability_status VARCHAR(32),
  exploitation_rate DECIMAL,
  expected_reserves_years INTEGER,
  share_in_energy_mix DECIMAL,
  classification_standard VARCHAR(32),
  energy_extraction_id INTEGER,
  formation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (energy_extraction_id) REFERENCES energy_extractions (id),
  FOREIGN KEY (formation_id) REFERENCES geological_formations (formation_id)
);
