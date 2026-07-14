CREATE TABLE decision_assessments (
  id INTEGER NOT NULL,
  assessment_id VARCHAR(42),
  assessment_date TIMESTAMP,
  decision_topic VARCHAR(32),
  assessor_id VARCHAR(44),
  capacity_status VARCHAR(32),
  support_provided VARCHAR(32),
  person_id VARCHAR(32),
  topic_id VARCHAR(40),
  professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (topic_id) REFERENCES decision_topics (topic_id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id)
);
