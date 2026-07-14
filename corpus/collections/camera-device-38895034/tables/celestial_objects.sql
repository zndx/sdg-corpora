CREATE TABLE celestial_objects (
  celestial_object_id INTEGER NOT NULL,
  object_identifier VARCHAR(32),
  common_name VARCHAR(32),
  catalog_designation VARCHAR(32),
  object_type VARCHAR(32),
  constellation VARCHAR(32),
  right_ascension DECIMAL,
  declination DECIMAL,
  apparent_magnitude DECIMAL,
  image_capture_id INTEGER,
  PRIMARY KEY (celestial_object_id),
  FOREIGN KEY (image_capture_id) REFERENCES image_captures (image_capture_id)
);
