CREATE TABLE persons (
  id INTEGER NOT NULL,
  full_name VARCHAR(36),
  employee_id VARCHAR(32),
  email_address VARCHAR(32),
  department_affiliation VARCHAR(32),
  has_university_car_access BOOLEAN,
  office_staff_role_id INTEGER,
  travel_request_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (office_staff_role_id) REFERENCES office_staff_roles (office_staff_role_id),
  FOREIGN KEY (travel_request_id) REFERENCES travel_requests (travel_request_id)
);
