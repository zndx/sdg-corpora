CREATE TABLE physical_amenities (
  physical_amenity_id INTEGER NOT NULL,
  amenity_id VARCHAR(35),
  amenity_type VARCHAR(32),
  quantity_provided INTEGER,
  is_clean BOOLEAN,
  is_accessible BOOLEAN,
  learning_environment_id INTEGER,
  participant_id INTEGER,
  PRIMARY KEY (physical_amenity_id),
  FOREIGN KEY (learning_environment_id) REFERENCES learning_environments (learning_environment_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
