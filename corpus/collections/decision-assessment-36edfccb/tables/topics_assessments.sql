CREATE TABLE topics_assessments (
  topic_id VARCHAR(40) NOT NULL,
  decision_assessment_id INTEGER NOT NULL,
  PRIMARY KEY (topic_id, decision_assessment_id),
  FOREIGN KEY (topic_id) REFERENCES decision_topics (topic_id),
  FOREIGN KEY (decision_assessment_id) REFERENCES decision_assessments (id)
);
