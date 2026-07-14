CREATE TABLE office_equipments (
  id INTEGER NOT NULL,
  equipment_id VARCHAR(34),
  equipment_type VARCHAR(32),
  location_room VARCHAR(32),
  is_restricted BOOLEAN,
  maintenance_status VARCHAR(32),
  office_room_id INTEGER,
  administrative_staff_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (office_room_id) REFERENCES office_rooms (office_room_id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id)
);
