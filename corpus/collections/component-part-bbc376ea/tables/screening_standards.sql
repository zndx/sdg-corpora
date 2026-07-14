CREATE TABLE screening_standards (
  id INTEGER NOT NULL,
  standard_code VARCHAR(32),
  level VARCHAR(32),
  description VARCHAR(32),
  component_part_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (component_part_id) REFERENCES component_parts (id)
);
