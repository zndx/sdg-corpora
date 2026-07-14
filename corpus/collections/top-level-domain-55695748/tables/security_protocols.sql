CREATE TABLE security_protocols (
  id INTEGER NOT NULL,
  protocol_name VARCHAR(32),
  version VARCHAR(32),
  deployment_status VARCHAR(32),
  last_verified DATE,
  top_level_domain_id INTEGER,
  abuse_rate_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (top_level_domain_id) REFERENCES top_level_domains (top_level_domain_id),
  FOREIGN KEY (abuse_rate_id) REFERENCES abuse_rates (id)
);
