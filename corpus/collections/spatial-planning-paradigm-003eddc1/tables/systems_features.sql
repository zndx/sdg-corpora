CREATE TABLE systems_features (
  ecological_system_id VARCHAR(44) NOT NULL,
  natural_feature_id INTEGER NOT NULL,
  PRIMARY KEY (ecological_system_id, natural_feature_id),
  FOREIGN KEY (ecological_system_id) REFERENCES ecological_systems (ecological_system_id),
  FOREIGN KEY (natural_feature_id) REFERENCES natural_features (id)
);
