CREATE TABLE modules_knowledges (
  learning_module_id INTEGER NOT NULL,
  participant_prior_knowledge_id INTEGER NOT NULL,
  PRIMARY KEY (learning_module_id, participant_prior_knowledge_id),
  FOREIGN KEY (learning_module_id) REFERENCES learning_modules (id),
  FOREIGN KEY (participant_prior_knowledge_id) REFERENCES participant_prior_knowledges (participant_prior_knowledge_id)
);
