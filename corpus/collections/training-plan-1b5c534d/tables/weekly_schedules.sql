CREATE TABLE weekly_schedules (
  weekly_schedule_id INTEGER NOT NULL,
  week_number INTEGER,
  plan_identifier VARCHAR(32),
  total_distance DECIMAL,
  target_distance DECIMAL,
  intensity_level VARCHAR(32),
  training_plan_id INTEGER,
  PRIMARY KEY (weekly_schedule_id),
  FOREIGN KEY (training_plan_id) REFERENCES training_plans (id)
);
