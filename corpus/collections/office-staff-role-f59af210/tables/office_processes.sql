CREATE TABLE office_processes (
  id INTEGER NOT NULL,
  process_type VARCHAR(32),
  operating_hours_start TIMESTAMP,
  operating_hours_end TIMESTAMP,
  is_lunch_break_included BOOLEAN,
  lunch_break_start TIMESTAMP,
  lunch_break_end TIMESTAMP,
  semester_restriction VARCHAR(32),
  office_staff_role_id INTEGER,
  document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (office_staff_role_id) REFERENCES office_staff_roles (office_staff_role_id),
  FOREIGN KEY (document_id) REFERENCES documents (id)
);
