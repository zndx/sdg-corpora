CREATE TABLE personal_informations (
  personal_information_id INTEGER NOT NULL,
  information_type VARCHAR(32),
  data_field VARCHAR(32),
  collection_method VARCHAR(32),
  is_sensitive BOOLEAN,
  retention_period VARCHAR(32),
  digital_technology_id INTEGER,
  individual_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (personal_information_id),
  FOREIGN KEY (digital_technology_id) REFERENCES digital_technologies (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
