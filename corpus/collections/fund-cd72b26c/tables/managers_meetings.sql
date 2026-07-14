CREATE TABLE managers_meetings (
  fund_manager_id INTEGER NOT NULL,
  corporate_meeting_id INTEGER NOT NULL,
  PRIMARY KEY (fund_manager_id, corporate_meeting_id),
  FOREIGN KEY (fund_manager_id) REFERENCES fund_managers (fund_manager_id),
  FOREIGN KEY (corporate_meeting_id) REFERENCES corporate_meetings (id)
);
