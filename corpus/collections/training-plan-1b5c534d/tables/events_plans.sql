CREATE TABLE events_plans (
  physical_event_id INTEGER NOT NULL,
  training_plan_id INTEGER NOT NULL,
  PRIMARY KEY (physical_event_id, training_plan_id),
  FOREIGN KEY (physical_event_id) REFERENCES physical_events (physical_event_id),
  FOREIGN KEY (training_plan_id) REFERENCES training_plans (id)
);
