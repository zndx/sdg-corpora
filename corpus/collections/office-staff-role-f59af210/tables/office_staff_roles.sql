CREATE TABLE office_staff_roles (
  office_staff_role_id INTEGER NOT NULL,
  role_title VARCHAR(32),
  office_location VARCHAR(32),
  phone_extension VARCHAR(32),
  is_authorized_operator BOOLEAN,
  has_emergency_authority BOOLEAN,
  person_id INTEGER,
  office_process_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (office_staff_role_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (office_process_id) REFERENCES office_processes (id)
);
