CREATE TABLE domains_names (
  top_level_domain_id INTEGER NOT NULL,
  domain_name_id INTEGER NOT NULL,
  PRIMARY KEY (top_level_domain_id, domain_name_id),
  FOREIGN KEY (top_level_domain_id) REFERENCES top_level_domains (top_level_domain_id),
  FOREIGN KEY (domain_name_id) REFERENCES domain_names (domain_name_id)
);
