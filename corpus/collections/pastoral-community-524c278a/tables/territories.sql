CREATE TABLE territories (
  id INTEGER NOT NULL,
  territory_name VARCHAR(32),
  location VARCHAR(32),
  area_size DECIMAL,
  dominant_ecosystem VARCHAR(32),
  well_watered_place_id INTEGER,
  territory_id INTEGER,
  pastoral_community_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (well_watered_place_id) REFERENCES well_watered_places (id),
  FOREIGN KEY (territory_id) REFERENCES territories (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id)
);
