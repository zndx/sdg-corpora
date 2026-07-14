CREATE TABLE environmental_hazards (
  hazard_id VARCHAR(32) NOT NULL,
  hazard_type VARCHAR(32),
  frequency VARCHAR(32),
  magnitude DECIMAL,
  affected_area VARCHAR(32),
  last_occurrence TIMESTAMP,
  community_id INTEGER,
  knowledge_base_id VARCHAR(32),
  PRIMARY KEY (hazard_id),
  FOREIGN KEY (community_id) REFERENCES communities (id),
  FOREIGN KEY (knowledge_base_id) REFERENCES scientific_knowledge_bases (knowledge_base_id)
);
