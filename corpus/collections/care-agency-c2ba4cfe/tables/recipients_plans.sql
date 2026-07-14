CREATE TABLE recipients_plans (
  care_recipient_id INTEGER NOT NULL,
  care_plan_id INTEGER NOT NULL,
  PRIMARY KEY (care_recipient_id, care_plan_id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (care_recipient_id),
  FOREIGN KEY (care_plan_id) REFERENCES care_plans (id)
);
