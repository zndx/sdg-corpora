CREATE TABLE network_equipments (
  equipment_id VARCHAR(34) NOT NULL,
  manufacturer VARCHAR(46),
  model VARCHAR(32),
  firmware_version VARCHAR(32),
  status VARCHAR(32),
  v_p_n_gateway_id INTEGER,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (v_p_n_gateway_id) REFERENCES v_p_n_gateways (v_p_n_gateway_id)
);
