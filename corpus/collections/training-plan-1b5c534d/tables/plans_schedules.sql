CREATE TABLE plans_schedules (
  training_plan_id INTEGER NOT NULL,
  weekly_schedule_id INTEGER NOT NULL,
  PRIMARY KEY (training_plan_id, weekly_schedule_id),
  FOREIGN KEY (training_plan_id) REFERENCES training_plans (id),
  FOREIGN KEY (weekly_schedule_id) REFERENCES weekly_schedules (weekly_schedule_id)
);
