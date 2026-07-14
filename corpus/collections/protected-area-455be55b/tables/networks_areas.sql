CREATE TABLE networks_areas (
  transalpine_ecological_network_id INTEGER NOT NULL,
  protected_area_id INTEGER NOT NULL,
  PRIMARY KEY (transalpine_ecological_network_id, protected_area_id),
  FOREIGN KEY (transalpine_ecological_network_id) REFERENCES transalpine_ecological_networks (id),
  FOREIGN KEY (protected_area_id) REFERENCES protected_areas (protected_area_id)
);
