CREATE TABLE gage_steps (
  id INTEGER NOT NULL,
  location VARCHAR(32),
  is_present BOOLEAN,
  taper_gage_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (id)
);
