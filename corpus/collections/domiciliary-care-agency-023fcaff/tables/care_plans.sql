CREATE TABLE care_plans (
  id INTEGER NOT NULL,
  plan_id INTEGER,
  last_review_date TIMESTAMP,
  dietary_requirements VARCHAR(32),
  medication_regimen VARCHAR(32),
  risk_assessment_status VARCHAR(32),
  care_recipient_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (id)
);
