CREATE TABLE events_communities (
  hydrological_event_id INTEGER NOT NULL,
  pastoral_community_id INTEGER NOT NULL,
  PRIMARY KEY (hydrological_event_id, pastoral_community_id),
  FOREIGN KEY (hydrological_event_id) REFERENCES hydrological_events (id),
  FOREIGN KEY (pastoral_community_id) REFERENCES pastoral_communities (pastoral_community_id)
);
