CREATE TABLE geographic_areas (
  id INTEGER NOT NULL,
  area_id VARCHAR(44),
  name VARCHAR(32),
  type VARCHAR(32),
  latitude DECIMAL,
  longitude DECIMAL,
  description VARCHAR(32),
  expedition_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (expedition_id) REFERENCES expeditions (expedition_id)
);
