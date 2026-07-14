CREATE TABLE administrative_roles (
  administrative_role_id INTEGER NOT NULL,
  role_name VARCHAR(32),
  role_category VARCHAR(32),
  is_supervisory BOOLEAN,
  reporting_line VARCHAR(32),
  administrative_staff_member_id INTEGER,
  PRIMARY KEY (administrative_role_id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id)
);
