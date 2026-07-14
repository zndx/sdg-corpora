CREATE TABLE locations_classrooms (
  physical_location_id INTEGER NOT NULL,
  classroom_id INTEGER NOT NULL,
  PRIMARY KEY (physical_location_id, classroom_id),
  FOREIGN KEY (physical_location_id) REFERENCES physical_locations (id),
  FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id)
);
