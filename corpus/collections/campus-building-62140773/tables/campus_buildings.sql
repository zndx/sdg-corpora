CREATE TABLE campus_buildings (
  id INTEGER NOT NULL,
  building_id INTEGER,
  building_name VARCHAR(32),
  year_built INTEGER,
  building_type VARCHAR(32),
  has_fiber_optic_cable BOOLEAN,
  number_of_floors INTEGER,
  academic_department_id INTEGER,
  campus_area_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_department_id) REFERENCES academic_departments (academic_department_id),
  FOREIGN KEY (campus_area_id) REFERENCES campus_areas (id)
);
