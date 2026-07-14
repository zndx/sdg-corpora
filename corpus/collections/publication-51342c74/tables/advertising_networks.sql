CREATE TABLE advertising_networks (
  advertising_network_id INTEGER NOT NULL,
  network_id VARCHAR(44),
  network_name VARCHAR(32),
  network_type VARCHAR(32),
  coverage_area VARCHAR(32),
  active_status BOOLEAN,
  monthly_impressions INTEGER,
  subsidiary_id INTEGER,
  publication_id INTEGER,
  PRIMARY KEY (advertising_network_id),
  FOREIGN KEY (subsidiary_id) REFERENCES subsidiaries (subsidiary_id),
  FOREIGN KEY (publication_id) REFERENCES publications (publication_id)
);
