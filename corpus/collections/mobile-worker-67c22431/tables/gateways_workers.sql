CREATE TABLE gateways_workers (
  v_p_n_gateway_id INTEGER NOT NULL,
  mobile_worker_id INTEGER NOT NULL,
  PRIMARY KEY (v_p_n_gateway_id, mobile_worker_id),
  FOREIGN KEY (v_p_n_gateway_id) REFERENCES v_p_n_gateways (v_p_n_gateway_id),
  FOREIGN KEY (mobile_worker_id) REFERENCES mobile_workers (mobile_worker_id)
);
