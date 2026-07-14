CREATE TABLE centers_networks (
  data_center_id INTEGER NOT NULL,
  network_id INTEGER NOT NULL,
  PRIMARY KEY (data_center_id, network_id),
  FOREIGN KEY (data_center_id) REFERENCES data_centers (id),
  FOREIGN KEY (network_id) REFERENCES networks (id)
);
