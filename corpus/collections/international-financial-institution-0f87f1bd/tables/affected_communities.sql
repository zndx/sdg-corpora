CREATE TABLE affected_communities (
  affected_community_id INTEGER NOT NULL,
  community_id VARCHAR(44),
  community_name VARCHAR(32),
  region VARCHAR(32),
  population_size INTEGER,
  vulnerability_index DECIMAL,
  primary_language VARCHAR(32),
  development_project_id INTEGER,
  accountability_mechanism_id INTEGER,
  PRIMARY KEY (affected_community_id),
  FOREIGN KEY (development_project_id) REFERENCES development_projects (id),
  FOREIGN KEY (accountability_mechanism_id) REFERENCES accountability_mechanisms (id)
);
