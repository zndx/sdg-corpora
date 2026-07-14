CREATE TABLE events_organizations (
  parade_event_id INTEGER NOT NULL,
  participating_organization_id INTEGER NOT NULL,
  PRIMARY KEY (parade_event_id, participating_organization_id),
  FOREIGN KEY (parade_event_id) REFERENCES parade_events (parade_event_id),
  FOREIGN KEY (participating_organization_id) REFERENCES participating_organizations (participating_organization_id)
);
