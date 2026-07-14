CREATE TABLE protected_areas (
  protected_area_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  area_hectares DECIMAL,
  established_date DATE,
  protection_level VARCHAR(33),
  administering_entity VARCHAR(32),
  is_a_l_p_a_r_c_member BOOLEAN,
  alpine_region_id INTEGER,
  transalpine_ecological_network_id INTEGER,
  PRIMARY KEY (protected_area_id),
  FOREIGN KEY (alpine_region_id) REFERENCES alpine_regions (id),
  FOREIGN KEY (transalpine_ecological_network_id) REFERENCES transalpine_ecological_networks (id)
);
