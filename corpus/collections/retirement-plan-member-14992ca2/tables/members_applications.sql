CREATE TABLE members_applications (
  member_id INTEGER NOT NULL,
  retirement_benefit_application_id INTEGER NOT NULL,
  PRIMARY KEY (member_id, retirement_benefit_application_id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id),
  FOREIGN KEY (retirement_benefit_application_id) REFERENCES retirement_benefit_applications (retirement_benefit_application_id)
);
