CREATE TABLE owners_facilities (
  land_owner_id INTEGER NOT NULL,
  observatory_facility_id INTEGER NOT NULL,
  PRIMARY KEY (land_owner_id, observatory_facility_id),
  FOREIGN KEY (land_owner_id) REFERENCES land_owners (id),
  FOREIGN KEY (observatory_facility_id) REFERENCES observatory_facilities (id)
);
