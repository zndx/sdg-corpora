CREATE TABLE members_beneficiaries (
  member_id INTEGER NOT NULL,
  beneficiary_id INTEGER NOT NULL,
  PRIMARY KEY (member_id, beneficiary_id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (id)
);
