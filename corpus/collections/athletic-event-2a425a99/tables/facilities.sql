CREATE TABLE facilities (
  id INTEGER NOT NULL,
  facility_identifier VARCHAR(32),
  facility_name VARCHAR(32),
  location_address VARCHAR(32),
  capacity INTEGER,
  is_secured BOOLEAN,
  last_inspection_date DATE,
  athletic_event_id INTEGER,
  equipment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (equipment_id) REFERENCES equipments (equipment_id)
);
