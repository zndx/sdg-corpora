CREATE TABLE systems_terms (
  knowledge_organization_system_id INTEGER NOT NULL,
  controlled_term_id INTEGER NOT NULL,
  PRIMARY KEY (knowledge_organization_system_id, controlled_term_id),
  FOREIGN KEY (knowledge_organization_system_id) REFERENCES knowledge_organization_systems (knowledge_organization_system_id),
  FOREIGN KEY (controlled_term_id) REFERENCES controlled_terms (controlled_term_id)
);
