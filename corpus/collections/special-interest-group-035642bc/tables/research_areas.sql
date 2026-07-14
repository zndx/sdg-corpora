CREATE TABLE research_areas (
  id INTEGER NOT NULL,
  name VARCHAR(32),
  classification VARCHAR(32),
  description VARCHAR(32),
  special_interest_group_id INTEGER,
  curriculum_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id),
  FOREIGN KEY (curriculum_id) REFERENCES curriculums (id)
);
