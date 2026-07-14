CREATE TABLE councils_facilities (
  coordinating_council_id INTEGER NOT NULL,
  treatment_facility_id INTEGER NOT NULL,
  PRIMARY KEY (coordinating_council_id, treatment_facility_id),
  FOREIGN KEY (coordinating_council_id) REFERENCES coordinating_councils (coordinating_council_id),
  FOREIGN KEY (treatment_facility_id) REFERENCES treatment_facilities (id)
);
