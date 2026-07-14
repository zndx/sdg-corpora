CREATE TABLE districts_campuses (
  district_id INTEGER NOT NULL,
  school_campus_id INTEGER NOT NULL,
  PRIMARY KEY (district_id, school_campus_id),
  FOREIGN KEY (district_id) REFERENCES districts (district_id),
  FOREIGN KEY (school_campus_id) REFERENCES school_campuses (school_campus_id)
);
