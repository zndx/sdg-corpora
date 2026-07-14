CREATE TABLE equipments (
  equipment_id INTEGER NOT NULL,
  equipment_name VARCHAR(32),
  condition VARCHAR(32),
  quantity INTEGER,
  last_maintenance_date DATE,
  athletic_event_id INTEGER,
  facility_id INTEGER,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (athletic_event_id) REFERENCES athletic_events (id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id)
);
