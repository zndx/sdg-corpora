CREATE TABLE i_e_p_teams (
  team_id VARCHAR(32) NOT NULL,
  team_name VARCHAR(32),
  meeting_frequency VARCHAR(32),
  last_meeting_date DATE,
  next_scheduled_meeting DATE,
  compliance_status VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (team_id)
);
