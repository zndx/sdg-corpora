CREATE TABLE brake_systems (
  brake_system_id INTEGER NOT NULL,
  front_disc_diameter DECIMAL,
  rear_disc_diameter DECIMAL,
  caliper_type VARCHAR(32),
  ventilation BOOLEAN,
  chassis_frame_id INTEGER,
  wheel_assembly_id INTEGER,
  PRIMARY KEY (brake_system_id),
  FOREIGN KEY (chassis_frame_id) REFERENCES chassis_frames (chassis_frame_id),
  FOREIGN KEY (wheel_assembly_id) REFERENCES wheel_assemblies (wheel_assembly_id)
);
