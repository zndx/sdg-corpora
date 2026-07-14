CREATE TABLE events_members (
  aquatic_event_id INTEGER NOT NULL,
  pool_staff_member_id INTEGER NOT NULL,
  PRIMARY KEY (aquatic_event_id, pool_staff_member_id),
  FOREIGN KEY (aquatic_event_id) REFERENCES aquatic_events (aquatic_event_id),
  FOREIGN KEY (pool_staff_member_id) REFERENCES pool_staff_members (id)
);
