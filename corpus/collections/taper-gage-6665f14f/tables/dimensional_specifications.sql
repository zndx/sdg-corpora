CREATE TABLE dimensional_specifications (
  dimensional_specification_id INTEGER NOT NULL,
  large_end_diameter DECIMAL,
  small_end_diameter DECIMAL,
  taper_rate_per_foot DECIMAL,
  taper_rate_per_inch DECIMAL,
  half_angle DECIMAL,
  included_angle DECIMAL,
  taper_gage_id INTEGER,
  PRIMARY KEY (dimensional_specification_id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (id)
);
