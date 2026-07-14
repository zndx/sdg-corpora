CREATE TABLE curriculums (
  id INTEGER NOT NULL,
  level VARCHAR(32),
  institution_type VARCHAR(32),
  status VARCHAR(32),
  special_interest_group_id INTEGER,
  research_area_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id),
  FOREIGN KEY (research_area_id) REFERENCES research_areas (id)
);
