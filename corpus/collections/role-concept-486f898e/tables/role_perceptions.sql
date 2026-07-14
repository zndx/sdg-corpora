CREATE TABLE role_perceptions (
  perception_id VARCHAR(32) NOT NULL,
  clarity_level VARCHAR(32),
  influencing_factors VARCHAR(32),
  public_health_roles BOOLEAN,
  reflexive_practice BOOLEAN,
  concept_id INTEGER,
  c_l_d_n_id INTEGER,
  enactment_id INTEGER,
  PRIMARY KEY (perception_id),
  FOREIGN KEY (concept_id) REFERENCES role_concepts (concept_id),
  FOREIGN KEY (c_l_d_n_id) REFERENCES c_l_d_ns (id),
  FOREIGN KEY (enactment_id) REFERENCES role_enactments (enactment_id)
);
