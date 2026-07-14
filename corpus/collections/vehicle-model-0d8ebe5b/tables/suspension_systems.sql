CREATE TABLE suspension_systems (
  suspension_system_id INTEGER NOT NULL,
  front_type VARCHAR(32),
  rear_type VARCHAR(32),
  seat_height DECIMAL,
  dive_control BOOLEAN,
  chassis_frame_id INTEGER,
  wheel_assembly_id INTEGER,
  PRIMARY KEY (suspension_system_id),
  FOREIGN KEY (chassis_frame_id) REFERENCES chassis_frames (chassis_frame_id),
  FOREIGN KEY (wheel_assembly_id) REFERENCES wheel_assemblies (wheel_assembly_id)
);
