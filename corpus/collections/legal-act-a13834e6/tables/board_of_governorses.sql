CREATE TABLE board_of_governorses (
  board_of_governors_id INTEGER NOT NULL,
  board_identifier VARCHAR(32),
  meeting_date TIMESTAMP,
  meeting_location VARCHAR(32),
  attendance_status VARCHAR(32),
  decision_outcome VARCHAR(32),
  agent_id INTEGER,
  fund_operation_id INTEGER,
  board_meeting_id INTEGER,
  PRIMARY KEY (board_of_governors_id),
  FOREIGN KEY (agent_id) REFERENCES agents (agent_id),
  FOREIGN KEY (fund_operation_id) REFERENCES fund_operations (fund_operation_id),
  FOREIGN KEY (board_meeting_id) REFERENCES board_meetings (id)
);
