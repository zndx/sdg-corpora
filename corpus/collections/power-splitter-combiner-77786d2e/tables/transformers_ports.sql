CREATE TABLE transformers_ports (
  transformer_id INTEGER NOT NULL,
  r_f_port_id INTEGER NOT NULL,
  PRIMARY KEY (transformer_id, r_f_port_id),
  FOREIGN KEY (transformer_id) REFERENCES transformers (transformer_id),
  FOREIGN KEY (r_f_port_id) REFERENCES r_f_ports (id)
);
