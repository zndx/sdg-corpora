CREATE TABLE manufacturers_gages (
  manufacturer_id INTEGER NOT NULL,
  taper_gage_id INTEGER NOT NULL,
  PRIMARY KEY (manufacturer_id, taper_gage_id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (taper_gage_id)
);
