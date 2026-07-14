CREATE TABLE privacy_reviews (
  id INTEGER NOT NULL,
  review_id VARCHAR(44),
  review_date TIMESTAMP,
  review_type VARCHAR(32),
  review_outcome VARCHAR(32),
  reviewer_name VARCHAR(32),
  prescribed_entity_id INTEGER,
  compliance_recommendation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (prescribed_entity_id) REFERENCES prescribed_entities (prescribed_entity_id),
  FOREIGN KEY (compliance_recommendation_id) REFERENCES compliance_recommendations (id)
);
