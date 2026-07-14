CREATE TABLE regions_communities (
  geographic_region_id INTEGER NOT NULL,
  pastoral_community_id INTEGER NOT NULL,
  PRIMARY KEY (geographic_region_id, pastoral_community_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id)
);
