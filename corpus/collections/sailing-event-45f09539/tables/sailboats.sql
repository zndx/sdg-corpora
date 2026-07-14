CREATE TABLE sailboats (
  id INTEGER NOT NULL,
  vessel_id VARCHAR(40),
  vessel_name VARCHAR(32),
  design_heel_angle DECIMAL,
  keel_material VARCHAR(32),
  current_heel_angle DECIMAL,
  status VARCHAR(32),
  dock_id INTEGER,
  sailing_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (dock_id) REFERENCES docks (id),
  FOREIGN KEY (sailing_event_id) REFERENCES sailing_events (id)
);
