CREATE TABLE transalpine_ecological_networks (
  id INTEGER NOT NULL,
  network_id VARCHAR(44),
  name VARCHAR(32),
  established_date DATE,
  total_corridor_length_km DECIMAL,
  status VARCHAR(32),
  coordinating_entity VARCHAR(32),
  a_l_p_a_r_c_organization_id VARCHAR(40),
  PRIMARY KEY (id),
  FOREIGN KEY (a_l_p_a_r_c_organization_id) REFERENCES a_l_p_a_r_cs (organization_id)
);
