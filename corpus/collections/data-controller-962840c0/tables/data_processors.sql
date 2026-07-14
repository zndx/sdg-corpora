CREATE TABLE data_processors (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  registration_number VARCHAR(32),
  registered_address VARCHAR(32),
  service_type VARCHAR(32),
  contract_start_date DATE,
  data_controller_id INTEGER,
  personal_data_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id),
  FOREIGN KEY (personal_data_id) REFERENCES personal_datas (id)
);
