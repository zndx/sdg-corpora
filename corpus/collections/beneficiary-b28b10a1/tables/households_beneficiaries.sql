CREATE TABLE households_beneficiaries (
  household_id INTEGER NOT NULL,
  beneficiary_id INTEGER NOT NULL,
  PRIMARY KEY (household_id, beneficiary_id),
  FOREIGN KEY (household_id) REFERENCES households (household_id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (beneficiary_id)
);
