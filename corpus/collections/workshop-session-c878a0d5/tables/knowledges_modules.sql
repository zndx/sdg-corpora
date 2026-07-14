CREATE TABLE knowledges_modules (
  participant_prior_knowledge_id INTEGER NOT NULL,
  learning_module_id INTEGER NOT NULL,
  PRIMARY KEY (participant_prior_knowledge_id, learning_module_id),
  FOREIGN KEY (participant_prior_knowledge_id) REFERENCES participant_prior_knowledges (participant_prior_knowledge_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id)
);
