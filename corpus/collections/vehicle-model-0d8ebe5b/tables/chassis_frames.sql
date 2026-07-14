CREATE TABLE chassis_frames (
  chassis_frame_id INTEGER NOT NULL,
  frame_designation VARCHAR(32),
  technology_name VARCHAR(32),
  geometry_control VARCHAR(32),
  wheelbase DECIMAL,
  ground_clearance DECIMAL,
  suspension_system_id INTEGER,
  brake_system_id INTEGER,
  capacity_specification_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (chassis_frame_id),
  FOREIGN KEY (suspension_system_id) REFERENCES suspension_systems (suspension_system_id),
  FOREIGN KEY (brake_system_id) REFERENCES brake_systems (brake_system_id),
  FOREIGN KEY (capacity_specification_id) REFERENCES capacity_specifications (id)
);
