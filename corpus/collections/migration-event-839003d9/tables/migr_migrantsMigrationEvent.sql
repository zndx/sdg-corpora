CREATE TABLE migr_migrantsMigrationEvent (
  migrant_id INTEGER NOT NULL,
  migration_event_id INTEGER NOT NULL,
  PRIMARY KEY (migrant_id, migration_event_id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id),
  FOREIGN KEY (migration_event_id) REFERENCES migr_migration_events (migration_event_id)
);
