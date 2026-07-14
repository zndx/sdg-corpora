CREATE TABLE scientific_knowledge_bases (
  knowledge_base_id VARCHAR(32) NOT NULL,
  data_source VARCHAR(32),
  model_type VARCHAR(32),
  resolution VARCHAR(32),
  last_updated TIMESTAMP,
  validation_status VARCHAR(32),
  community_id INTEGER,
  strategy_id INTEGER,
  interacts_with_knowledge_base_id VARCHAR(32),
  PRIMARY KEY (knowledge_base_id),
  FOREIGN KEY (community_id) REFERENCES communities (id),
  FOREIGN KEY (strategy_id) REFERENCES risk_reduction_strategies (strategy_id),
  FOREIGN KEY (interacts_with_knowledge_base_id) REFERENCES indigenous_knowledge_bases (knowledge_base_id)
);
