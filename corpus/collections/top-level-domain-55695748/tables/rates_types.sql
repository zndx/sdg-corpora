CREATE TABLE rates_types (
  abuse_rate_id INTEGER NOT NULL,
  abuse_type_id INTEGER NOT NULL,
  PRIMARY KEY (abuse_rate_id, abuse_type_id),
  FOREIGN KEY (abuse_rate_id) REFERENCES abuse_rates (id),
  FOREIGN KEY (abuse_type_id) REFERENCES abuse_types (id)
);
