CREATE TABLE units_links (
  data_acquisition_unit_id INTEGER NOT NULL,
  network_link_id INTEGER NOT NULL,
  PRIMARY KEY (data_acquisition_unit_id, network_link_id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id),
  FOREIGN KEY (network_link_id) REFERENCES network_links (id)
);
