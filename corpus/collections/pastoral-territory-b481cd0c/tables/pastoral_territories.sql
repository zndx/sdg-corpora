CREATE TABLE pastoral_territories (
  id INTEGER NOT NULL,
  territory_identifier VARCHAR(32),
  territory_name VARCHAR(32),
  primary_ethnic_group VARCHAR(32),
  area_hectares DECIMAL,
  establishment_date DATE,
  current_status VARCHAR(32),
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
