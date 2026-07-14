CREATE TABLE classrooms (
  classroom_id INTEGER NOT NULL,
  room_identifier VARCHAR(32),
  capacity INTEGER,
  equipment_inventory VARCHAR(32),
  physical_location_id INTEGER,
  PRIMARY KEY (classroom_id),
  FOREIGN KEY (physical_location_id) REFERENCES physical_locations (id)
);
