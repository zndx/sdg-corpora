CREATE TABLE spatial_planning_paradigms (
  id INTEGER NOT NULL,
  paradigm_id INTEGER,
  name VARCHAR(32),
  theoretical_focus VARCHAR(32),
  methodological_focus VARCHAR(32),
  status VARCHAR(32),
  land_use_id INTEGER,
  ecological_system_id VARCHAR(44),
  policy_instrument_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (land_use_id) REFERENCES land_uses (id),
  FOREIGN KEY (ecological_system_id) REFERENCES ecological_systems (ecological_system_id),
  FOREIGN KEY (policy_instrument_id) REFERENCES policy_instruments (policy_instrument_id)
);
