CREATE TABLE project_segments (
  project_segment_id INTEGER NOT NULL,
  segment_code VARCHAR(32),
  segment_description VARCHAR(32),
  valuation_amount VARCHAR(32),
  fee_amount DECIMAL,
  segment_count INTEGER,
  permit_id VARCHAR(44),
  inspection_event_id INTEGER,
  PRIMARY KEY (project_segment_id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (inspection_event_id) REFERENCES inspection_events (id)
);
