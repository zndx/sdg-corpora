CREATE TABLE structures (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  name VARCHAR(32),
  location VARCHAR(32),
  area DECIMAL,
  volume DECIMAL,
  status VARCHAR(32),
  construction_date TIMESTAMP,
  shock_absorber_id INTEGER,
  shock_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (shock_absorber_id) REFERENCES shock_absorbers (id),
  FOREIGN KEY (shock_event_id) REFERENCES shock_events (shock_event_id)
);
