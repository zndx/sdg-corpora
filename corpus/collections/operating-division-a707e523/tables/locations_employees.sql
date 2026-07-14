CREATE TABLE locations_employees (
  office_location_id INTEGER NOT NULL,
  employee_id INTEGER NOT NULL,
  PRIMARY KEY (office_location_id, employee_id),
  FOREIGN KEY (office_location_id) REFERENCES office_locations (office_location_id),
  FOREIGN KEY (employee_id) REFERENCES employees (id)
);
