CREATE TABLE well_watered_places (
  id INTEGER NOT NULL,
  place_name VARCHAR(32),
  water_source VARCHAR(32),
  reliability VARCHAR(32),
  socio_ecological_niche BOOLEAN,
  territory_id INTEGER,
  pastoral_community_id INTEGER,
  water_management_practice_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (territory_id) REFERENCES territories (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (water_management_practice_id) REFERENCES water_management_practices (water_management_practice_id)
);
