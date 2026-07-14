CREATE TABLE compliance_recommendations (
  id INTEGER NOT NULL,
  recommendation_id VARCHAR(44),
  issue_date TIMESTAMP,
  priority_level VARCHAR(32),
  status VARCHAR(32),
  description VARCHAR(32),
  privacy_review_id INTEGER,
  prescribed_entity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (privacy_review_id) REFERENCES privacy_reviews (id),
  FOREIGN KEY (prescribed_entity_id) REFERENCES prescribed_entities (prescribed_entity_id)
);
