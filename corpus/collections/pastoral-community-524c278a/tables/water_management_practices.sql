CREATE TABLE water_management_practices (
  water_management_practice_id INTEGER NOT NULL,
  practice_name VARCHAR(32),
  conservation_level VARCHAR(32),
  historical_period VARCHAR(32),
  effectiveness VARCHAR(32),
  pastoral_community_id INTEGER,
  territory_id INTEGER,
  hydrological_stress_id INTEGER,
  PRIMARY KEY (water_management_practice_id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id),
  FOREIGN KEY (territory_id) REFERENCES territories (id),
  FOREIGN KEY (hydrological_stress_id) REFERENCES hydrological_stresses (hydrological_stress_id)
);
