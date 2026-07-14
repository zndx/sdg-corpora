CREATE TABLE procedures_types (
  safeguarding_procedure_id INTEGER NOT NULL,
  harm_type_id INTEGER NOT NULL,
  PRIMARY KEY (safeguarding_procedure_id, harm_type_id),
  FOREIGN KEY (safeguarding_procedure_id) REFERENCES safeguarding_procedures (safeguarding_procedure_id),
  FOREIGN KEY (harm_type_id) REFERENCES harm_types (id)
);
