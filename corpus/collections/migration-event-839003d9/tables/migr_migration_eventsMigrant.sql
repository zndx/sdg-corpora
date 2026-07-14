CREATE TABLE migr_migration_eventsMigrant (
  migration_event_id INTEGER NOT NULL,
  migrant_id INTEGER NOT NULL,
  PRIMARY KEY (migration_event_id, migrant_id),
  FOREIGN KEY (migration_event_id) REFERENCES migr_migration_events (migration_event_id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id)
);
