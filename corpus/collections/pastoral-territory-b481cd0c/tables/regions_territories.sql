CREATE TABLE regions_territories (
  geographic_region_id INTEGER NOT NULL,
  pastoral_territory_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, pastoral_territory_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (pastoral_territory_id) REFERENCES pastoral_territories (id)
);
