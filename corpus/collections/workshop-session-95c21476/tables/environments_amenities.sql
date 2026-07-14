CREATE TABLE environments_amenities (
  learning_environment_id INTEGER NOT NULL,
  physical_amenity_id INTEGER NOT NULL,
  PRIMARY KEY (learning_environment_id, physical_amenity_id),
  FOREIGN KEY (learning_environment_id) REFERENCES learning_environments (learning_environment_id),
  FOREIGN KEY (physical_amenity_id) REFERENCES physical_amenities (physical_amenity_id)
);
