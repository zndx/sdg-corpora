CREATE TABLE parasitic_weed_specieses (
  id INTEGER NOT NULL,
  species_code VARCHAR(32),
  common_name VARCHAR(32),
  parasitic_type VARCHAR(32),
  chlorophyll_presence BOOLEAN,
  seed_production_rate DECIMAL,
  seed_longevity_years DECIMAL,
  seed_size_micrograms DECIMAL,
  germination_cue_required BOOLEAN,
  field_id VARCHAR(44),
  germination_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (field_id) REFERENCES agricultural_fields (field_id),
  FOREIGN KEY (germination_requirement_id) REFERENCES germination_requirements (germination_requirement_id)
);
