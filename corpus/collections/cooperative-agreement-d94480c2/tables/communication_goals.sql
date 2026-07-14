CREATE TABLE communication_goals (
  communication_goal_id INTEGER NOT NULL,
  goal_identifier VARCHAR(32),
  goal_description VARCHAR(32),
  target_audience VARCHAR(32),
  priority_level INTEGER,
  organization_id INTEGER,
  assistive_technology_id INTEGER,
  individual_id INTEGER,
  PRIMARY KEY (communication_goal_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (assistive_technology_id) REFERENCES assistive_technologies (assistive_technology_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id)
);
