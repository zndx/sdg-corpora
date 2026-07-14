CREATE TABLE participant_prior_knowledges (
  participant_prior_knowledge_id INTEGER NOT NULL,
  knowledge_id VARCHAR(44),
  topic_area VARCHAR(32),
  proficiency_level VARCHAR(32),
  source_experience VARCHAR(32),
  last_updated TIMESTAMP,
  participant_id INTEGER,
  PRIMARY KEY (participant_prior_knowledge_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
