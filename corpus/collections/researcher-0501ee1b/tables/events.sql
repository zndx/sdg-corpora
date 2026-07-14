CREATE TABLE events (
  id INTEGER NOT NULL,
  event_id VARCHAR(44),
  event_name VARCHAR(32),
  event_type VARCHAR(39),
  start_date DATE,
  end_date DATE,
  region VARCHAR(41),
  status VARCHAR(32),
  followed_by_event_id INTEGER,
  project_proposal_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (followed_by_event_id) REFERENCES events (id),
  FOREIGN KEY (project_proposal_id) REFERENCES project_proposals (id)
);
