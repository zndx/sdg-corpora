CREATE TABLE capacity_specifications (
  id INTEGER NOT NULL,
  capacity_type VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  location VARCHAR(32),
  chassis_frame_id INTEGER,
  powertrain_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chassis_frame_id) REFERENCES chassis_frames (chassis_frame_id),
  FOREIGN KEY (powertrain_id) REFERENCES powertrains (powertrain_id)
);
