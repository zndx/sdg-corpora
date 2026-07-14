CREATE TABLE files_names (
  zone_file_id INTEGER NOT NULL,
  domain_name_id INTEGER NOT NULL,
  PRIMARY KEY (zone_file_id, domain_name_id),
  FOREIGN KEY (zone_file_id) REFERENCES zone_files (zone_file_id),
  FOREIGN KEY (domain_name_id) REFERENCES domain_names (domain_name_id)
);
