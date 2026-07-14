CREATE TABLE territories_sources (
  pastoral_territory_id INTEGER NOT NULL,
  water_source_id INTEGER NOT NULL,
  PRIMARY KEY (pastoral_territory_id, water_source_id),
  FOREIGN KEY (pastoral_territory_id) REFERENCES pastoral_territories (id),
  FOREIGN KEY (water_source_id) REFERENCES water_sources (id)
);
