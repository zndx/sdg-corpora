CREATE TABLE banks_programs (
  economic_development_bank_id INTEGER NOT NULL,
  capital_access_program_id INTEGER NOT NULL,
  PRIMARY KEY (economic_development_bank_id, capital_access_program_id),
  FOREIGN KEY (economic_development_bank_id) REFERENCES economic_development_banks (economic_development_bank_id),
  FOREIGN KEY (capital_access_program_id) REFERENCES capital_access_programs (capital_access_program_id)
);
