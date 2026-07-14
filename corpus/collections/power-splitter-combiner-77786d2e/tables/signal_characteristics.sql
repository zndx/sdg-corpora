CREATE TABLE signal_characteristics (
  id INTEGER NOT NULL,
  characteristic_type VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  measurement_condition VARCHAR(32),
  status VARCHAR(32),
  power_splitter_combiner_id INTEGER,
  r_f_port_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (power_splitter_combiner_id) REFERENCES power_splitter_combiners (id),
  FOREIGN KEY (r_f_port_id) REFERENCES r_f_ports (id)
);
