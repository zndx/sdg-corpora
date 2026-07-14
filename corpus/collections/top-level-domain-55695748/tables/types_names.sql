CREATE TABLE types_names (
  abuse_type_id INTEGER NOT NULL,
  domain_name_id INTEGER NOT NULL,
  PRIMARY KEY (abuse_type_id, domain_name_id),
  FOREIGN KEY (abuse_type_id) REFERENCES abuse_types (id),
  FOREIGN KEY (domain_name_id) REFERENCES domain_names (domain_name_id)
);
