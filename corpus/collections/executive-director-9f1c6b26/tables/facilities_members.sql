CREATE TABLE facilities_members (
  facility_id INTEGER NOT NULL,
  staff_member_staff_id INTEGER NOT NULL,
  PRIMARY KEY (facility_id, staff_member_staff_id),
  FOREIGN KEY (facility_id) REFERENCES facilities (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
