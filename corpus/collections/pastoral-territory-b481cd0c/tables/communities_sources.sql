CREATE TABLE communities_sources (
  pastoral_community_id INTEGER NOT NULL,
  water_source_id INTEGER NOT NULL,
  PRIMARY KEY (pastoral_community_id, water_source_id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (water_source_id) REFERENCES water_sources (id)
);
