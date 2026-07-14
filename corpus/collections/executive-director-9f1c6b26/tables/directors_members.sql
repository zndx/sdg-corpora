CREATE TABLE directors_members (
  executive_director_id INTEGER NOT NULL,
  staff_member_staff_id INTEGER NOT NULL,
  PRIMARY KEY (executive_director_id, staff_member_staff_id),
  FOREIGN KEY (executive_director_id) REFERENCES executive_directors (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
