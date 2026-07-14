CREATE TABLE alternative_livelihoods (
  id INTEGER NOT NULL,
  livelihood_type VARCHAR(32),
  adoption_rate DECIMAL,
  primary_drivers VARCHAR(32),
  sustainability VARCHAR(32),
  pastoral_community_id INTEGER,
  well_watered_place_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (well_watered_place_id) REFERENCES well_watered_places (id)
);
