CREATE TABLE germination_requirements (
  germination_requirement_id INTEGER NOT NULL,
  requirement_type VARCHAR(32),
  cue_substance VARCHAR(32),
  moisture_threshold DECIMAL,
  host_root_proximity_required BOOLEAN,
  parasitic_weed_species_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (germination_requirement_id),
  FOREIGN KEY (parasitic_weed_species_id) REFERENCES parasitic_weed_specieses (id)
);
