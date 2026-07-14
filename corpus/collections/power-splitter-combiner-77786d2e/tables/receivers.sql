CREATE TABLE receivers (
  id INTEGER NOT NULL,
  receiver_identifier VARCHAR(32),
  receiver_type VARCHAR(32),
  input_impedance DECIMAL,
  sensitivity DECIMAL,
  status VARCHAR(32),
  r_f_port_id INTEGER,
  antenna_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (r_f_port_id) REFERENCES r_f_ports (id),
  FOREIGN KEY (antenna_id) REFERENCES antennas (antenna_id)
);
