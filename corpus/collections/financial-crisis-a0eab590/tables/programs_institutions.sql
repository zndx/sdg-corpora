CREATE TABLE programs_institutions (
  bailout_program_id INTEGER NOT NULL,
  financial_institution_id INTEGER NOT NULL,
  PRIMARY KEY (bailout_program_id, financial_institution_id),
  FOREIGN KEY (bailout_program_id) REFERENCES bailout_programs (bailout_program_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id)
);
