CREATE TABLE programs_persons (
  educational_program_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (educational_program_id, person_id),
  FOREIGN KEY (educational_program_id) REFERENCES educational_programs (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
