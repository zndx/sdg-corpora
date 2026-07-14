CREATE TABLE data_controllers (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  registration_number VARCHAR(32),
  registered_address VARCHAR(32),
  contact_email VARCHAR(32),
  jurisdiction VARCHAR(32),
  data_processor_id INTEGER,
  privacy_representative_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_processor_id) REFERENCES data_processors (id),
  FOREIGN KEY (privacy_representative_id) REFERENCES privacy_representatives (id)
);
