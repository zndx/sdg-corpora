CREATE TABLE tolerance_requirements (
  id INTEGER NOT NULL,
  large_end_tolerance DECIMAL,
  taper_tolerance_per_inch DECIMAL,
  reference_standard VARCHAR(32),
  taper_gage_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (id)
);
