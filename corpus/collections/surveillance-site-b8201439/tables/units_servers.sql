CREATE TABLE units_servers (
  data_acquisition_unit_id INTEGER NOT NULL,
  processing_server_id INTEGER NOT NULL,
  PRIMARY KEY (data_acquisition_unit_id, processing_server_id),
  FOREIGN KEY (data_acquisition_unit_id) REFERENCES data_acquisition_units (id),
  FOREIGN KEY (processing_server_id) REFERENCES processing_servers (id)
);
