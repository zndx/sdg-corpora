CREATE TABLE verisign_d_do_s_services (
  service_id VARCHAR(44) NOT NULL,
  platform_name VARCHAR(32),
  api_endpoint VARCHAR(32),
  support_level VARCHAR(32),
  is_active BOOLEAN,
  last_updated TIMESTAMP,
  forti_d_do_s_appliance_id INTEGER,
  athena_platform_id INTEGER,
  d_do_s_attack_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (service_id),
  FOREIGN KEY (forti_d_do_s_appliance_id) REFERENCES forti_d_do_s_appliances (id),
  FOREIGN KEY (athena_platform_id) REFERENCES athena_platforms (id),
  FOREIGN KEY (d_do_s_attack_id) REFERENCES d_do_s_attacks (id)
);
