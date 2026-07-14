CREATE TABLE networks (
  id INTEGER NOT NULL,
  network_id VARCHAR(44),
  peering_i_s_ps VARCHAR(32),
  firewall_enabled BOOLEAN,
  vpn_required BOOLEAN,
  tls_version VARCHAR(32),
  ddos_protection_enabled BOOLEAN,
  arbour_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (arbour_system_id) REFERENCES arbour_systems (id)
);
