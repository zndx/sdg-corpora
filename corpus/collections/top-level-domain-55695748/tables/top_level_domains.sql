CREATE TABLE top_level_domains (
  top_level_domain_id INTEGER NOT NULL,
  tld_identifier VARCHAR(32),
  delegation_date DATE,
  registry_operator VARCHAR(32),
  is_delegated BOOLEAN,
  total_registered_names INTEGER,
  retail_price DECIMAL,
  abuse_rate_id INTEGER,
  security_protocol_id INTEGER,
  PRIMARY KEY (top_level_domain_id),
  FOREIGN KEY (abuse_rate_id) REFERENCES abuse_rates (id),
  FOREIGN KEY (security_protocol_id) REFERENCES security_protocols (id)
);
