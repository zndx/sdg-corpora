CREATE TABLE controlled_terms (
  controlled_term_id INTEGER NOT NULL,
  term_id VARCHAR(32),
  pref_label VARCHAR(32),
  alt_label VARCHAR(32),
  definition VARCHAR(32),
  broader_term VARCHAR(32),
  narrower_term VARCHAR(32),
  related_term VARCHAR(32),
  knowledge_organization_system_id INTEGER,
  synonym_of_controlled_term_id INTEGER,
  broader_than_controlled_term_id INTEGER,
  narrower_than_controlled_term_id INTEGER,
  PRIMARY KEY (controlled_term_id),
  FOREIGN KEY (knowledge_organization_system_id) REFERENCES knowledge_organization_systems (knowledge_organization_system_id),
  FOREIGN KEY (synonym_of_controlled_term_id) REFERENCES controlled_terms (controlled_term_id),
  FOREIGN KEY (broader_than_controlled_term_id) REFERENCES controlled_terms (controlled_term_id),
  FOREIGN KEY (narrower_than_controlled_term_id) REFERENCES controlled_terms (controlled_term_id)
);
