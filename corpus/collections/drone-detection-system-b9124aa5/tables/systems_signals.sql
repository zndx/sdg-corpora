CREATE TABLE systems_signals (
  drone_detection_system_id INTEGER NOT NULL,
  drone_signal_id INTEGER NOT NULL,
  PRIMARY KEY (drone_detection_system_id, drone_signal_id),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id),
  FOREIGN KEY (drone_signal_id) REFERENCES drone_signals (id)
);
