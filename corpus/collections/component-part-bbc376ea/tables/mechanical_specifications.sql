CREATE TABLE mechanical_specifications (
  id INTEGER NOT NULL,
  case_style VARCHAR(32),
  marking_style VARCHAR(32),
  pinout_description VARCHAR(32),
  storage_temperature_range VARCHAR(32),
  component_part_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (component_part_id) REFERENCES component_parts (id)
);
