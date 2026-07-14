CREATE TABLE staff_professional_developments (
  training_id VARCHAR(44) NOT NULL,
  training_date DATE,
  topic VARCHAR(37),
  status VARCHAR(32),
  staff_member_id VARCHAR(44),
  student_placement_id INTEGER,
  assigned_to_staff_staff_member_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (training_id),
  FOREIGN KEY (student_placement_id) REFERENCES student_placements (id),
  FOREIGN KEY (assigned_to_staff_staff_member_id) REFERENCES staff_members (staff_member_id)
);
