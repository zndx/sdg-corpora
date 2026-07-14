CREATE TABLE staff_roles (
  staff_role_id INTEGER NOT NULL,
  role_identifier VARCHAR(32),
  role_name VARCHAR(32),
  department VARCHAR(32),
  receives_service_charge BOOLEAN,
  receives_direct_tips BOOLEAN,
  service_charge_id INTEGER,
  menu_course_id INTEGER,
  PRIMARY KEY (staff_role_id),
  FOREIGN KEY (service_charge_id) REFERENCES service_charges (service_charge_id),
  FOREIGN KEY (menu_course_id) REFERENCES menu_courses (id)
);
