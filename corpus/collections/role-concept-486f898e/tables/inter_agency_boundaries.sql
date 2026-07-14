CREATE TABLE inter_agency_boundaries (
  id INTEGER NOT NULL,
  boundary_id INTEGER,
  agency_type VARCHAR(32),
  tension_level VARCHAR(32),
  encroachment_present BOOLEAN,
  impact_on_role VARCHAR(32),
  c_l_d_n_id INTEGER,
  enactment_id INTEGER,
  perception_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (c_l_d_n_id) REFERENCES c_l_d_ns (id),
  FOREIGN KEY (enactment_id) REFERENCES role_enactments (enactment_id),
  FOREIGN KEY (perception_id) REFERENCES role_perceptions (perception_id)
);
