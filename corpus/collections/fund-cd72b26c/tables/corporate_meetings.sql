CREATE TABLE corporate_meetings (
  id INTEGER NOT NULL,
  meeting_identifier VARCHAR(32),
  meeting_date TIMESTAMP,
  meeting_type VARCHAR(32),
  participants_count INTEGER,
  meeting_outcome VARCHAR(32),
  is_confidential BOOLEAN,
  meeting_duration_minutes INTEGER,
  location VARCHAR(32),
  fund_manager_id INTEGER,
  asset_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (fund_manager_id) REFERENCES fund_managers (fund_manager_id),
  FOREIGN KEY (asset_id) REFERENCES assets (asset_id)
);
