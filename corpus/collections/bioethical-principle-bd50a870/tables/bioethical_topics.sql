CREATE TABLE bioethical_topics (
  bioethical_topic_id INTEGER NOT NULL,
  topic_code VARCHAR(32),
  topic_name VARCHAR(32),
  is_controversial BOOLEAN,
  regulatory_status VARCHAR(32),
  course_id INTEGER,
  ethical_decision_id INTEGER,
  PRIMARY KEY (bioethical_topic_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (ethical_decision_id) REFERENCES ethical_decisions (id)
);
