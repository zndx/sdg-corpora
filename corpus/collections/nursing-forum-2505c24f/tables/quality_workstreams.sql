CREATE TABLE quality_workstreams (
  quality_workstream_id INTEGER NOT NULL,
  workstream_id INTEGER,
  workstream_title VARCHAR(32),
  start_date TIMESTAMP,
  target_metric VARCHAR(32),
  status VARCHAR(32),
  scope VARCHAR(32),
  nursing_forum_id INTEGER,
  nursing_professional_id INTEGER,
  clinical_outcome_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (quality_workstream_id),
  FOREIGN KEY (nursing_forum_id) REFERENCES nursing_forums (nursing_forum_id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id),
  FOREIGN KEY (clinical_outcome_id) REFERENCES clinical_outcomes (clinical_outcome_id)
);
