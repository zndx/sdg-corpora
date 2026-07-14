CREATE TABLE pastoral_communities (
  pastoral_community_id INTEGER NOT NULL,
  community_name VARCHAR(32),
  territory_name VARCHAR(32),
  primary_livelihood VARCHAR(32),
  historical_presence INTEGER,
  territory_id INTEGER,
  water_management_practice_id INTEGER,
  alternative_livelihood_id INTEGER,
  PRIMARY KEY (pastoral_community_id),
  FOREIGN KEY (territory_id) REFERENCES territories (id),
  FOREIGN KEY (water_management_practice_id) REFERENCES water_management_practices (water_management_practice_id),
  FOREIGN KEY (alternative_livelihood_id) REFERENCES alternative_livelihoods (id)
);
