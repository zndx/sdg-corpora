CREATE TABLE certifications_members (
  safety_certification_id INTEGER NOT NULL,
  pool_staff_member_id INTEGER NOT NULL,
  PRIMARY KEY (safety_certification_id, pool_staff_member_id),
  FOREIGN KEY (safety_certification_id) REFERENCES safety_certifications (id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id)
);
