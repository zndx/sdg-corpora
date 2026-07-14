CREATE TABLE withdrawals_persons (
  systematic_withdrawal_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (systematic_withdrawal_id, person_id),
  FOREIGN KEY (systematic_withdrawal_id) REFERENCES systematic_withdrawals (id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
