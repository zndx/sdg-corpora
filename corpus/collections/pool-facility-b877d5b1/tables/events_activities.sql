CREATE TABLE events_activities (
  aquatic_event_id INTEGER NOT NULL,
  maintenance_activity_id INTEGER NOT NULL,
  PRIMARY KEY (aquatic_event_id, maintenance_activity_id),
  FOREIGN KEY (aquatic_event_id) REFERENCES aquatic_events (aquatic_event_id),
  FOREIGN KEY (maintenance_activity_id) REFERENCES maintenance_activities (maintenance_activity_id)
);
