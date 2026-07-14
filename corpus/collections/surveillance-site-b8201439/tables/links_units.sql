CREATE TABLE links_units (
  network_link_id INTEGER NOT NULL,
  data_acquisition_unit_id INTEGER NOT NULL,
  PRIMARY KEY (network_link_id, data_acquisition_unit_id),
  FOREIGN KEY (network_link_id) REFERENCES network_links (id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id)
);
