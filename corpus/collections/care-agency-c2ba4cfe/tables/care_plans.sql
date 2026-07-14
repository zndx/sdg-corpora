CREATE TABLE care_plans (
  id INTEGER NOT NULL,
  care_plan_id VARCHAR(44),
  plan_start_date TIMESTAMP,
  plan_end_date TIMESTAMP,
  review_frequency VARCHAR(32),
  nutrition_monitoring BOOLEAN,
  hydration_monitoring BOOLEAN,
  medication_management BOOLEAN,
  care_recipient_id INTEGER,
  care_task_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (care_recipient_id),
  FOREIGN KEY (care_task_id) REFERENCES care_tasks (id)
);
