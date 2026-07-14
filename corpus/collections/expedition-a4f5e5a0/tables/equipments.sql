CREATE TABLE equipments (
  equipment_id INTEGER NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  weight_kg DECIMAL,
  designer VARCHAR(32),
  status VARCHAR(32),
  expedition_id INTEGER,
  PRIMARY KEY (equipment_id),
  FOREIGN KEY (expedition_id) REFERENCES expeditions (expedition_id)
);
