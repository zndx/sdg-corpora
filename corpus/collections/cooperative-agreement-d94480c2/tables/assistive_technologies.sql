CREATE TABLE assistive_technologies (
  assistive_technology_id INTEGER NOT NULL,
  technology_identifier VARCHAR(32),
  product_name VARCHAR(32),
  technology_type VARCHAR(32),
  manufacturer VARCHAR(32),
  availability_status VARCHAR(32),
  organization_id INTEGER,
  individual_id INTEGER,
  communication_goal_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (assistive_technology_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (communication_goal_id) REFERENCES communication_goals (communication_goal_id)
);
