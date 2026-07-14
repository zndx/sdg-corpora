CREATE TABLE combiners_ports (
  power_splitter_combiner_id INTEGER NOT NULL,
  r_f_port_id INTEGER NOT NULL,
  PRIMARY KEY (power_splitter_combiner_id, r_f_port_id),
  FOREIGN KEY (power_splitter_combiner_id) REFERENCES power_splitter_combiners (id),
  FOREIGN KEY (r_f_port_id) REFERENCES r_f_ports (id)
);
