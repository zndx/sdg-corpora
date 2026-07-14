CREATE TABLE strategic_plans (
  id INTEGER NOT NULL,
  plan_id INTEGER,
  plan_name VARCHAR(32),
  planning_horizon INTEGER,
  is_driver_based BOOLEAN,
  approval_status VARCHAR(32),
  last_review_date TIMESTAMP,
  user_id VARCHAR(44),
  business_segment_id INTEGER,
  controlling_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES controlling_users (user_id),
  FOREIGN KEY (business_segment_id) REFERENCES business_segments (id),
  FOREIGN KEY (controlling_report_id) REFERENCES controlling_reports (id)
);
