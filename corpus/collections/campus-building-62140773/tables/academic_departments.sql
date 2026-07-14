CREATE TABLE academic_departments (
  academic_department_id INTEGER NOT NULL,
  department_id VARCHAR(32),
  department_name VARCHAR(32),
  parent_university VARCHAR(32),
  has_museum BOOLEAN,
  offers_graduate_program BOOLEAN,
  number_of_students INTEGER,
  campus_building_id INTEGER,
  campus_event_id INTEGER,
  PRIMARY KEY (academic_department_id),
  FOREIGN KEY (campus_building_id) REFERENCES campus_buildings (id),
  FOREIGN KEY (campus_event_id) REFERENCES campus_events (campus_event_id)
);
