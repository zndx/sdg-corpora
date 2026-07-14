CREATE TABLE communities (
  id INTEGER NOT NULL,
  community_id VARCHAR(44),
  community_name VARCHAR(32),
  province VARCHAR(32),
  population INTEGER,
  island_group VARCHAR(32),
  primary_livelihood VARCHAR(32),
  vulnerability_level VARCHAR(32),
  knowledge_base_id VARCHAR(32),
  hosts_scientific_assessment_knowledge_base_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (knowledge_base_id) REFERENCES indigenous_knowledge_bases (knowledge_base_id),
  FOREIGN KEY (hosts_scientific_assessment_knowledge_base_id) REFERENCES scientific_knowledge_bases (knowledge_base_id)
);
