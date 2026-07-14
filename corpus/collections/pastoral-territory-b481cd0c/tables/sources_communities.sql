CREATE TABLE sources_communities (
  water_source_id INTEGER NOT NULL,
  pastoral_community_id INTEGER NOT NULL,
  PRIMARY KEY (water_source_id, pastoral_community_id),
  FOREIGN KEY (water_source_id) REFERENCES water_sources (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id)
);
