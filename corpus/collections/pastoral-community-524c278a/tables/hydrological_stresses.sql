CREATE TABLE hydrological_stresses (
  hydrological_stress_id INTEGER NOT NULL,
  stress_level VARCHAR(32),
  duration INTEGER,
  affected_area VARCHAR(32),
  impact_on_livelihood VARCHAR(32),
  pastoral_community_id INTEGER,
  territory_id INTEGER,
  water_management_practice_id INTEGER,
  PRIMARY KEY (hydrological_stress_id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (territory_id) REFERENCES territories (id),
  FOREIGN KEY (water_management_practice_id) REFERENCES water_management_practices (water_management_practice_id)
);
