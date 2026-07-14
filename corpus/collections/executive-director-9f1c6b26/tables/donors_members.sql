CREATE TABLE donors_members (
  donor_id INTEGER NOT NULL,
  staff_member_staff_id INTEGER NOT NULL,
  PRIMARY KEY (donor_id, staff_member_staff_id),
  FOREIGN KEY (donor_id) REFERENCES donors (id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
