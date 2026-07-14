CREATE TABLE risk_reduction_strategies (
  strategy_id INTEGER NOT NULL,
  strategy_name VARCHAR(32),
  integration_level VARCHAR(32),
  implementation_status VARCHAR(32),
  target_hazard VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  community_id INTEGER,
  knowledge_base_id VARCHAR(32),
  draws_from_scientific_knowledge_knowledge_base_id VARCHAR(32),
  PRIMARY KEY (strategy_id),
  FOREIGN KEY (community_id) REFERENCES communities (id),
  FOREIGN KEY (knowledge_base_id) REFERENCES indigenous_knowledge_bases (knowledge_base_id),
  FOREIGN KEY (draws_from_scientific_knowledge_knowledge_base_id) REFERENCES scientific_knowledge_bases (knowledge_base_id)
);
