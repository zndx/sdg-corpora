CREATE TABLE d_do_s_attacks (
  id INTEGER NOT NULL,
  attack_id INTEGER,
  attack_type VARCHAR(32),
  layer INTEGER,
  peak_bandwidth DECIMAL,
  start_date_time TIMESTAMP,
  end_date_time TIMESTAMP,
  is_mitigated BOOLEAN,
  network_service_id INTEGER,
  forti_d_do_s_appliance_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (network_service_id) REFERENCES network_services (id),
  FOREIGN KEY (forti_d_do_s_appliance_id) REFERENCES forti_d_do_s_appliances (id)
);
