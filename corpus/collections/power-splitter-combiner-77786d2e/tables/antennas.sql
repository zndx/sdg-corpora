CREATE TABLE antennas (
  antenna_id INTEGER NOT NULL,
  antenna_identifier VARCHAR(32),
  antenna_type VARCHAR(32),
  resonant_frequency DECIMAL,
  impedance DECIMAL,
  status VARCHAR(32),
  r_f_port_id INTEGER,
  receiver_id INTEGER,
  PRIMARY KEY (antenna_id),
  FOREIGN KEY (r_f_port_id) REFERENCES r_f_ports (id),
  FOREIGN KEY (receiver_id) REFERENCES receivers (id)
);
