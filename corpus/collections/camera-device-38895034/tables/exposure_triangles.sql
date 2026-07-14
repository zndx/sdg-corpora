CREATE TABLE exposure_triangles (
  exposure_triangle_id INTEGER NOT NULL,
  triangle_identifier VARCHAR(32),
  shutter_speed DECIMAL,
  aperture_value DECIMAL,
  iso_setting INTEGER,
  exposure_value DECIMAL,
  is_balanced BOOLEAN,
  image_capture_id INTEGER,
  PRIMARY KEY (exposure_triangle_id),
  FOREIGN KEY (image_capture_id) REFERENCES image_captures (image_capture_id)
);
