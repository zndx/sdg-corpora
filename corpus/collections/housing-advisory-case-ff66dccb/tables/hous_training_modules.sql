CREATE TABLE hous_training_modules (
  module_id VARCHAR(33) NOT NULL,
  title VARCHAR(32),
  delivery_mode VARCHAR(32),
  level VARCHAR(32),
  duration_hours DECIMAL,
  is_free BOOLEAN,
  last_updated DATE,
  housing_specialist_id INTEGER,
  topic_id VARCHAR(40),
  PRIMARY KEY (module_id),
  FOREIGN KEY (housing_specialist_id) REFERENCES hous_housing_specialists (id),
  FOREIGN KEY (topic_id) REFERENCES hous_legal_topics (topic_id)
);
