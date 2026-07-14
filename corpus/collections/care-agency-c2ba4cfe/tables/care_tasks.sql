CREATE TABLE care_tasks (
  id INTEGER NOT NULL,
  task_id VARCHAR(32),
  task_description VARCHAR(32),
  task_category VARCHAR(32),
  requires_two_staff BOOLEAN,
  care_plan_id INTEGER,
  staff_assignment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (care_plan_id) REFERENCES care_plans (id),
  FOREIGN KEY (staff_assignment_id) REFERENCES staff_assignments (id)
);
