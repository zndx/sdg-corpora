CREATE TABLE lab_activities (
  lab_activity_id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  title VARCHAR(32),
  description VARCHAR(32),
  duration_minutes INTEGER,
  difficulty_level VARCHAR(32),
  status VARCHAR(32),
  faculty_member_id INTEGER,
  lab_material_id INTEGER,
  PRIMARY KEY (lab_activity_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (lab_material_id) REFERENCES lab_materials (id)
);
