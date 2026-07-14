CREATE TABLE compliance_trainings (
  id INTEGER NOT NULL,
  training_id VARCHAR(44),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location VARCHAR(32),
  attendee_count INTEGER,
  is_completed BOOLEAN,
  follow_up_frequency VARCHAR(32),
  financial_institution_id INTEGER,
  consultancy_team_id INTEGER,
  sanctions_screening_tool_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id),
  FOREIGN KEY (consultancy_team_id) REFERENCES consultancy_teams (id),
  FOREIGN KEY (sanctions_screening_tool_id) REFERENCES sanctions_screening_tools (sanctions_screening_tool_id)
);
