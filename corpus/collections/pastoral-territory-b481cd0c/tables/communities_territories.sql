CREATE TABLE communities_territories (
  pastoral_community_id INTEGER NOT NULL,
  pastoral_territory_id INTEGER NOT NULL,
  PRIMARY KEY (pastoral_community_id, pastoral_territory_id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (pastoral_territory_id) REFERENCES pastoral_territories (id)
);
