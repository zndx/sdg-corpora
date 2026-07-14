CREATE TABLE thematic_areas (
  thematic_area_id INTEGER NOT NULL,
  area_id VARCHAR(44),
  area_name VARCHAR(42),
  project_proposal_id INTEGER,
  PRIMARY KEY (thematic_area_id),
  FOREIGN KEY (project_proposal_id) REFERENCES project_proposals (id)
);
