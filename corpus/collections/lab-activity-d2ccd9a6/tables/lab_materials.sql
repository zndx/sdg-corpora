CREATE TABLE lab_materials (
  id INTEGER NOT NULL,
  material_id VARCHAR(44),
  name VARCHAR(32),
  quantity DECIMAL,
  unit VARCHAR(32),
  storage_location VARCHAR(32),
  lab_activity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (lab_activity_id) REFERENCES lab_activities (lab_activity_id)
);
