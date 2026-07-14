CREATE TABLE networks_centers (
  network_id INTEGER NOT NULL,
  data_center_id INTEGER NOT NULL,
  PRIMARY KEY (network_id, data_center_id),
  FOREIGN KEY (network_id) REFERENCES networks (id),
  FOREIGN KEY (data_center_id) REFERENCES data_centers (id)
);
