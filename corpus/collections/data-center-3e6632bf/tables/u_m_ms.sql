CREATE TABLE u_m_ms (
  u_m_m_id INTEGER NOT NULL,
  module_id VARCHAR(33),
  database_type VARCHAR(32),
  authentication_protocol VARCHAR(32),
  registered_applications INTEGER,
  last_sync_date TIMESTAMP,
  status VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (u_m_m_id)
);
