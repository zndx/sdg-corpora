CREATE TABLE corporate_networks (
  id INTEGER NOT NULL,
  network_id VARCHAR(44),
  network_name VARCHAR(32),
  ip_range VARCHAR(32),
  security_level VARCHAR(32),
  last_audit_date DATE,
  v_p_n_gateway_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (v_p_n_gateway_id) REFERENCES v_p_n_gateways (v_p_n_gateway_id)
);
