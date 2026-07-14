CREATE TABLE programs_individuals (
  clinical_program_id INTEGER NOT NULL,
  individual_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_program_id, individual_id),
  FOREIGN KEY (clinical_program_id) REFERENCES clinical_programs (clinical_program_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id)
);
