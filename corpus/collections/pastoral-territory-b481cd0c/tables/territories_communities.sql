CREATE TABLE territories_communities (
  pastoral_territory_id INTEGER NOT NULL,
  pastoral_community_id INTEGER NOT NULL,
  PRIMARY KEY (pastoral_territory_id, pastoral_community_id),
  FOREIGN KEY (pastoral_territory_id) REFERENCES pastoral_territories (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id)
);
