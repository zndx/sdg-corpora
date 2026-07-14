CREATE TABLE wheel_assemblies (
  wheel_assembly_id INTEGER NOT NULL,
  position VARCHAR(32),
  tire_width DECIMAL,
  tire_height DECIMAL,
  rim_diameter DECIMAL,
  rim_material VARCHAR(32),
  tire_model VARCHAR(32),
  suspension_system_id INTEGER,
  brake_system_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (wheel_assembly_id),
  FOREIGN KEY (suspension_system_id) REFERENCES suspension_systems (suspension_system_id),
  FOREIGN KEY (brake_system_id) REFERENCES brake_systems (brake_system_id)
);
