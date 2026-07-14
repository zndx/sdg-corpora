CREATE TABLE servers_units (
  processing_server_id INTEGER NOT NULL,
  data_acquisition_unit_id INTEGER NOT NULL,
  PRIMARY KEY (processing_server_id, data_acquisition_unit_id),
  FOREIGN KEY (processing_server_id) REFERENCES processing_servers (id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id)
);
