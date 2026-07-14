CREATE TABLE members_certifications (
  pool_staff_member_id INTEGER NOT NULL,
  safety_certification_id INTEGER NOT NULL,
  PRIMARY KEY (pool_staff_member_id, safety_certification_id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id),
  FOREIGN KEY (safety_certification_id) REFERENCES safety_certifications (id)
);
