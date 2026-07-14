CREATE TABLE internal_training_classes (
  id INTEGER NOT NULL,
  class_id INTEGER,
  class_name VARCHAR(32),
  topic_category VARCHAR(32),
  scheduled_date TIMESTAMP,
  max_capacity INTEGER,
  current_enrollment INTEGER,
  office_location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (office_location_id) REFERENCES office_locations (office_location_id)
);
