CREATE TABLE c_l_d_ns (
  id INTEGER NOT NULL,
  nurse_id VARCHAR(44),
  specialization VARCHAR(32),
  years_of_experience INTEGER,
  inter_agency_collaboration VARCHAR(44),
  role_clarity VARCHAR(32),
  enactment_id INTEGER,
  perception_id VARCHAR(32),
  inter_agency_boundary_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (enactment_id) REFERENCES role_enactments (enactment_id),
  FOREIGN KEY (perception_id) REFERENCES role_perceptions (perception_id),
  FOREIGN KEY (inter_agency_boundary_id) REFERENCES inter_agency_boundaries (id)
);
