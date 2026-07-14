CREATE TABLE ethical_decisions (
  id INTEGER NOT NULL,
  decision_identifier VARCHAR(32),
  decision_date TIMESTAMP,
  decision_status VARCHAR(32),
  clinical_context VARCHAR(32),
  is_controversial BOOLEAN,
  bioethical_topic_id INTEGER,
  medical_professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (bioethical_topic_id) REFERENCES bioethical_topics (bioethical_topic_id),
  FOREIGN KEY (medical_professional_id) REFERENCES medical_professionals (medical_professional_id)
);
