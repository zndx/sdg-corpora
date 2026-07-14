CREATE TABLE facilities_telescopes (
  observatory_facility_id INTEGER NOT NULL,
  telescope_id INTEGER NOT NULL,
  PRIMARY KEY (observatory_facility_id, telescope_id),
  FOREIGN KEY (observatory_facility_id) REFERENCES observatory_facilities (id),
  FOREIGN KEY (telescope_id) REFERENCES telescopes (id)
);
