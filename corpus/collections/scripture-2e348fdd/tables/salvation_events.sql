CREATE TABLE salvation_events (
  salvation_event_id INTEGER NOT NULL,
  is_instantaneous BOOLEAN,
  requires_faith BOOLEAN,
  is_by_grace BOOLEAN,
  is_through_word BOOLEAN,
  is_irreversible BOOLEAN,
  PRIMARY KEY (salvation_event_id)
);
