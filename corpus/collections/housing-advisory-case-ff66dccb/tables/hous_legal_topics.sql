CREATE TABLE hous_legal_topics (
  topic_id VARCHAR(40) NOT NULL,
  topic_name VARCHAR(32),
  category VARCHAR(32),
  last_reviewed DATE,
  is_current BOOLEAN,
  module_id VARCHAR(33),
  housing_advisory_case_id INTEGER,
  PRIMARY KEY (topic_id),
  FOREIGN KEY (module_id) REFERENCES hous_training_modules (module_id),
  FOREIGN KEY (housing_advisory_case_id) REFERENCES hous_housing_advisory_cases (id)
);
