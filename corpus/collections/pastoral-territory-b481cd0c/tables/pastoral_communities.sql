CREATE TABLE pastoral_communities (
  pastoral_community_id INTEGER NOT NULL,
  community_identifier VARCHAR(32),
  community_name VARCHAR(32),
  population_size INTEGER,
  primary_livelihood VARCHAR(32),
  herd_size INTEGER,
  decimation_event VARCHAR(32),
  adaptation_strategy VARCHAR(32),
  geographic_region_id INTEGER,
  PRIMARY KEY (pastoral_community_id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
