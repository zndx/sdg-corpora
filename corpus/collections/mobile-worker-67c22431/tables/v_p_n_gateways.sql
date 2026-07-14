CREATE TABLE v_p_n_gateways (
  v_p_n_gateway_id INTEGER NOT NULL,
  gateway_id INTEGER,
  location VARCHAR(32),
  region VARCHAR(32),
  max_concurrent_users INTEGER,
  encryption_protocol VARCHAR(32),
  status VARCHAR(32),
  capacity_utilization DECIMAL,
  corporate_network_id INTEGER,
  equipment_id VARCHAR(34),
  PRIMARY KEY (v_p_n_gateway_id),
  FOREIGN KEY (corporate_network_id) REFERENCES corporate_networks (id),
  FOREIGN KEY (equipment_id) REFERENCES network_equipments (equipment_id)
);
