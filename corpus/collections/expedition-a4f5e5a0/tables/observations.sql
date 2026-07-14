CREATE TABLE observations (
  observation_id INTEGER NOT NULL,
  timestamp TIMESTAMP,
  parameter VARCHAR(32),
  value DECIMAL,
  unit VARCHAR(32),
  status VARCHAR(32),
  expedition_id INTEGER,
  equipment_id INTEGER,
  PRIMARY KEY (observation_id),
  FOREIGN KEY (expedition_id) REFERENCES expeditions (expedition_id),
  FOREIGN KEY (equipment_id) REFERENCES equipments (equipment_id)
);
