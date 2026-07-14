CREATE TABLE gage_specifications (
  gage_specification_id INTEGER NOT NULL,
  large_end_diameter DECIMAL,
  small_end_diameter DECIMAL,
  taper_per_foot DECIMAL,
  taper_per_inch DECIMAL,
  taper_tolerance DECIMAL,
  half_angle DECIMAL,
  included_angle DECIMAL,
  has_steps BOOLEAN,
  step_location VARCHAR(32),
  taper_gage_id INTEGER,
  PRIMARY KEY (gage_specification_id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (taper_gage_id)
);
