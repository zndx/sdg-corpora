CREATE TABLE plans_staffs (
  care_plan_id INTEGER NOT NULL,
  care_staff_id INTEGER NOT NULL,
  PRIMARY KEY (care_plan_id, care_staff_id),
  FOREIGN KEY (care_plan_id) REFERENCES care_plans (id),
  FOREIGN KEY (care_staff_id) REFERENCES care_staffs (care_staff_id)
);
