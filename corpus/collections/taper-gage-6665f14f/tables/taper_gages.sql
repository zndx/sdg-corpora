CREATE TABLE taper_gages (
  id INTEGER NOT NULL,
  gage_type VARCHAR(32),
  tool_number VARCHAR(32),
  mark_size VARCHAR(32),
  large_end_diameter DECIMAL,
  small_end_diameter DECIMAL,
  taper_rate DECIMAL,
  taper_tolerance DECIMAL,
  included_angle DECIMAL,
  dimensional_specification_id INTEGER,
  tolerance_requirement_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dimensional_specification_id) REFERENCES dimensional_specifications (dimensional_specification_id),
  FOREIGN KEY (tolerance_requirement_id) REFERENCES tolerance_requirements (id)
);
