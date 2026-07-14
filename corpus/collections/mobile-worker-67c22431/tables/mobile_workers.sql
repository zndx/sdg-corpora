CREATE TABLE mobile_workers (
  mobile_worker_id INTEGER NOT NULL,
  worker_id VARCHAR(32),
  employee_name VARCHAR(32),
  department VARCHAR(32),
  role VARCHAR(32),
  device_type VARCHAR(32),
  os_platform VARCHAR(32),
  authentication_realm VARCHAR(32),
  last_login_timestamp TIMESTAMP,
  authentication_server_id INTEGER,
  user_role_id INTEGER,
  v_p_n_gateway_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (mobile_worker_id),
  FOREIGN KEY (authentication_server_id) REFERENCES authentication_servers (id),
  FOREIGN KEY (user_role_id) REFERENCES user_roles (id),
  FOREIGN KEY (v_p_n_gateway_id) REFERENCES v_p_n_gateways (v_p_n_gateway_id)
);
