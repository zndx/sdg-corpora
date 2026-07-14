CREATE TABLE signals_systems (
  drone_signal_id INTEGER NOT NULL,
  drone_detection_system_id INTEGER NOT NULL,
  PRIMARY KEY (drone_signal_id, drone_detection_system_id),
  FOREIGN KEY (drone_signal_id) REFERENCES drone_signals (id),
  FOREIGN KEY (drone_detection_system_id) REFERENCES drone_detection_systems (id)
);
