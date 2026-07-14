CREATE TABLE abuse_types (
  id INTEGER NOT NULL,
  abuse_code VARCHAR(44),
  description VARCHAR(32),
  severity_level INTEGER,
  is_mitigated BOOLEAN,
  abuse_rate_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (abuse_rate_id) REFERENCES abuse_rates (id)
);
