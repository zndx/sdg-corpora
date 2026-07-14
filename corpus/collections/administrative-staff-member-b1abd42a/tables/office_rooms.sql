CREATE TABLE office_rooms (
  office_room_id INTEGER NOT NULL,
  room_number VARCHAR(32),
  building_name VARCHAR(32),
  floor_number INTEGER,
  room_type VARCHAR(32),
  is_locked BOOLEAN,
  office_equipment_id INTEGER,
  administrative_staff_member_id INTEGER,
  PRIMARY KEY (office_room_id),
  FOREIGN KEY (office_equipment_id) REFERENCES office_equipments (id),
  FOREIGN KEY (administrative_staff_member_id) REFERENCES administrative_staff_members (id)
);
