CREATE TABLE requestors_gages (
  requestor_id INTEGER NOT NULL,
  taper_gage_id INTEGER NOT NULL,
  PRIMARY KEY (requestor_id, taper_gage_id),
  FOREIGN KEY (requestor_id) REFERENCES requestors (requestor_id),
  FOREIGN KEY (taper_gage_id) REFERENCES taper_gages (taper_gage_id)
);
