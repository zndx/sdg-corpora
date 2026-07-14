CREATE TABLE surfing_datas (
  id INTEGER NOT NULL,
  ip_address VARCHAR(32),
  domain_name VARCHAR(32),
  operating_system VARCHAR(32),
  visit_timestamp TIMESTAMP,
  session_duration DECIMAL,
  is_anonymous BOOLEAN,
  data_controller_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (data_controller_id) REFERENCES data_controllers (id)
);
