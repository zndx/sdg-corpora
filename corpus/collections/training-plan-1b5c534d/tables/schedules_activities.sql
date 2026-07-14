CREATE TABLE schedules_activities (
  weekly_schedule_id INTEGER NOT NULL,
  daily_activity_id INTEGER NOT NULL,
  PRIMARY KEY (weekly_schedule_id, daily_activity_id),
  FOREIGN KEY (weekly_schedule_id) REFERENCES weekly_schedules (weekly_schedule_id),
  FOREIGN KEY (daily_activity_id) REFERENCES daily_activities (id)
);
