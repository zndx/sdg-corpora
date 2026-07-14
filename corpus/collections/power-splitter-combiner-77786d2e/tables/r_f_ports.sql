CREATE TABLE r_f_ports (
  id INTEGER NOT NULL,
  port_identifier VARCHAR(32),
  port_label VARCHAR(32),
  impedance DECIMAL,
  termination_state VARCHAR(32),
  vswr DECIMAL,
  power_splitter_combiner_id INTEGER,
  antenna_id INTEGER,
  receiver_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (power_splitter_combiner_id) REFERENCES power_splitter_combiners (id),
  FOREIGN KEY (antenna_id) REFERENCES antennas (antenna_id),
  FOREIGN KEY (receiver_id) REFERENCES receivers (id)
);
