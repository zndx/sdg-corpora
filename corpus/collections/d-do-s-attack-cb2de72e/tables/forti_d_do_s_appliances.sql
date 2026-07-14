CREATE TABLE forti_d_do_s_appliances (
  id INTEGER NOT NULL,
  appliance_id VARCHAR(32),
  model VARCHAR(32),
  firmware_version VARCHAR(32),
  deployment_location VARCHAR(32),
  max_throughput_gbps DECIMAL,
  is_always_on BOOLEAN,
  last_health_check TIMESTAMP,
  network_service_id INTEGER,
  service_id VARCHAR(44),
  d_do_s_attack_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (network_service_id) REFERENCES network_services (id),
  FOREIGN KEY (service_id) REFERENCES verisign_d_do_s_services (service_id),
  FOREIGN KEY (d_do_s_attack_id) REFERENCES d_do_s_attacks (id)
);
