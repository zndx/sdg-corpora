CREATE TABLE drones_signals (
  drone_id INTEGER NOT NULL,
  drone_signal_id INTEGER NOT NULL,
  PRIMARY KEY (drone_id, drone_signal_id),
  FOREIGN KEY (drone_id) REFERENCES drones (id),
  FOREIGN KEY (drone_signal_id) REFERENCES drone_signals (id)
);
