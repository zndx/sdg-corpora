CREATE TABLE inspection_events (
  id INTEGER NOT NULL,
  inspection_id VARCHAR(32),
  scheduled_date TIMESTAMP,
  completion_date TIMESTAMP,
  inspection_type VARCHAR(32),
  result_status VARCHAR(32),
  completed_within24_hours BOOLEAN,
  inspector_badge_number VARCHAR(32),
  permit_id VARCHAR(44),
  property_parcel_id INTEGER,
  project_segment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (permit_id) REFERENCES building_permits (permit_id),
  FOREIGN KEY (property_parcel_id) REFERENCES property_parcels (id),
  FOREIGN KEY (project_segment_id) REFERENCES project_segments (project_segment_id)
);
