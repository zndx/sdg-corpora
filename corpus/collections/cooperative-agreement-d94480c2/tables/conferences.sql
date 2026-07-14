CREATE TABLE conferences (
  conference_id INTEGER NOT NULL,
  conference_identifier VARCHAR(32),
  conference_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  frequency VARCHAR(32),
  location VARCHAR(32),
  organization_id INTEGER,
  individual_id INTEGER,
  communication_goal_id INTEGER,
  PRIMARY KEY (conference_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (communication_goal_id) REFERENCES communication_goals (communication_goal_id)
);
