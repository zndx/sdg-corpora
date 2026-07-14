CREATE TABLE r_a_c_ses (
  id INTEGER NOT NULL,
  system_id INTEGER,
  version VARCHAR(32),
  deployment_type VARCHAR(32),
  ha_enabled BOOLEAN,
  last_audit_date DATE,
  compliance_standard VARCHAR(32),
  u_m_m_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (u_m_m_id) REFERENCES u_m_ms (u_m_m_id)
);
