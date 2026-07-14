CREATE TABLE d_r_m_systems (
  drm_id VARCHAR(44) NOT NULL,
  vendor_name VARCHAR(32),
  encryption_standard VARCHAR(32),
  compliance_level VARCHAR(32),
  license_server_url VARCHAR(65),
  PRIMARY KEY (drm_id)
);
