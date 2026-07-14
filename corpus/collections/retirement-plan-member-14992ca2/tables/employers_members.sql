CREATE TABLE employers_members (
  participating_employer_id INTEGER NOT NULL,
  member_id INTEGER NOT NULL,
  PRIMARY KEY (participating_employer_id, member_id),
  FOREIGN KEY (participating_employer_id) REFERENCES participating_employers (id),
  FOREIGN KEY (member_id) REFERENCES retirement_plan_members (member_id)
);
