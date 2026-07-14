CREATE TABLE administrative_staff_members (
  id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  office_location VARCHAR(32),
  phone_number VARCHAR(32),
  role_title VARCHAR(32),
  department VARCHAR(32),
  administrative_role_id INTEGER,
  office_room_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_role_id) REFERENCES administrative_roles (administrative_role_id),
  FOREIGN KEY (office_room_id) REFERENCES office_rooms (office_room_id)
);
