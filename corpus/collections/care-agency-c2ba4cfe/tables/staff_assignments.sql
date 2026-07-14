CREATE TABLE staff_assignments (
  id INTEGER NOT NULL,
  assignment_id VARCHAR(44),
  scheduled_date_time TIMESTAMP,
  completed_date_time TIMESTAMP,
  staff_count_required INTEGER,
  assignment_status VARCHAR(32),
  care_recipient_id INTEGER,
  care_task_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (care_recipient_id),
  FOREIGN KEY (care_task_id) REFERENCES care_tasks (id)
);
