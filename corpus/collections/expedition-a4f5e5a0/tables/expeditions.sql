CREATE TABLE expeditions (
  expedition_id INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  duration_days INTEGER,
  objective VARCHAR(32),
  status VARCHAR(32),
  team_size INTEGER,
  region VARCHAR(32),
  explorer_id INTEGER,
  equipment_id INTEGER,
  observation_id INTEGER,
  geographic_area_id INTEGER,
  PRIMARY KEY (expedition_id),
  FOREIGN KEY (explorer_id) REFERENCES explorers (explorer_id),
  FOREIGN KEY (equipment_id) REFERENCES equipments (equipment_id),
  FOREIGN KEY (observation_id) REFERENCES observations (observation_id),
  FOREIGN KEY (geographic_area_id) REFERENCES geographic_areas (id)
);
