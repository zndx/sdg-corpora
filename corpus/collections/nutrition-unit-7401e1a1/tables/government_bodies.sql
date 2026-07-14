CREATE TABLE government_bodies (
  government_body_id INTEGER NOT NULL,
  body_id VARCHAR(32),
  body_name VARCHAR(32),
  country_code VARCHAR(44),
  policy_status VARCHAR(32),
  budget_allocation VARCHAR(32),
  coordination_level VARCHAR(32),
  last_policy_review DATE,
  policy_recommendation_id INTEGER,
  nutrition_unit_id INTEGER,
  staff_member_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (government_body_id),
  FOREIGN KEY (policy_recommendation_id) REFERENCES policy_recommendations (id),
  FOREIGN KEY (nutrition_unit_id) REFERENCES nutrition_units (id),
  FOREIGN KEY (staff_member_id) REFERENCES staff_members (staff_member_id)
);
