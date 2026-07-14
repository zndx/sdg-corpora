CREATE TABLE locations_classes (
  office_location_id INTEGER NOT NULL,
  internal_training_class_id INTEGER NOT NULL,
  PRIMARY KEY (office_location_id, internal_training_class_id),
  FOREIGN KEY (office_location_id) REFERENCES office_locations (office_location_id),
  FOREIGN KEY (internal_training_class_id) REFERENCES internal_training_classes (id)
);
