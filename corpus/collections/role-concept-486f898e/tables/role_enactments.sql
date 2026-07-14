CREATE TABLE role_enactments (
  enactment_id INTEGER NOT NULL,
  quality_of_enactment VARCHAR(32),
  influencing_factors VARCHAR(32),
  inter_agency_boundaries VARCHAR(45),
  role_conflict_present BOOLEAN,
  concept_id INTEGER,
  c_l_d_n_id INTEGER,
  healthcare_delivery_id INTEGER,
  PRIMARY KEY (enactment_id),
  FOREIGN KEY (concept_id) REFERENCES role_concepts (concept_id),
  FOREIGN KEY (c_l_d_n_id) REFERENCES c_l_d_ns (id),
  FOREIGN KEY (healthcare_delivery_id) REFERENCES healthcare_deliveries (healthcare_delivery_id)
);
