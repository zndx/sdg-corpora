CREATE TABLE natural_features (
  id INTEGER NOT NULL,
  feature_id VARCHAR(44),
  name VARCHAR(32),
  category VARCHAR(32),
  perceived_value DECIMAL,
  ecological_system_id VARCHAR(44),
  public_perception_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (ecological_system_id) REFERENCES ecological_systems (ecological_system_id),
  FOREIGN KEY (public_perception_id) REFERENCES public_perceptions (public_perception_id)
);
