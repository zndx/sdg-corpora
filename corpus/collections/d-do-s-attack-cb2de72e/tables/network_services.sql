CREATE TABLE network_services (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  ip_address VARCHAR(32),
  port INTEGER,
  protocol VARCHAR(32),
  criticality_level VARCHAR(32),
  is_internet_facing BOOLEAN,
  d_do_s_attack_id INTEGER,
  forti_d_do_s_appliance_id INTEGER,
  scrubbing_center_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (d_do_s_attack_id) REFERENCES d_do_s_attacks (id),
  FOREIGN KEY (forti_d_do_s_appliance_id) REFERENCES forti_d_do_s_appliances (id),
  FOREIGN KEY (scrubbing_center_id) REFERENCES scrubbing_centers (id)
);
