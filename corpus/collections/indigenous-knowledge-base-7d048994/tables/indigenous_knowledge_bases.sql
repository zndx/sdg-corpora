CREATE TABLE indigenous_knowledge_bases (
  knowledge_base_id VARCHAR(32) NOT NULL,
  community_name VARCHAR(32),
  region VARCHAR(32),
  primary_hazard_type VARCHAR(32),
  transmission_mode VARCHAR(32),
  last_verified_date TIMESTAMP,
  is_integrated BOOLEAN,
  community_id INTEGER,
  strategy_id INTEGER,
  interacts_with_knowledge_base_id VARCHAR(32),
  PRIMARY KEY (knowledge_base_id),
  FOREIGN KEY (community_id) REFERENCES communities (id),
  FOREIGN KEY (strategy_id) REFERENCES risk_reduction_strategies (strategy_id),
  FOREIGN KEY (interacts_with_knowledge_base_id) REFERENCES scientific_knowledge_bases (knowledge_base_id)
);
