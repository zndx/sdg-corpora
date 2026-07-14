CREATE TABLE training_plans (
  id INTEGER NOT NULL,
  plan_identifier VARCHAR(32),
  plan_title VARCHAR(32),
  target_event VARCHAR(32),
  duration_weeks INTEGER,
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  physical_event_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (physical_event_id) REFERENCES physical_events (physical_event_id)
);
