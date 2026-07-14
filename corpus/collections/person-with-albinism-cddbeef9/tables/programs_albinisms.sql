CREATE TABLE programs_albinisms (
  education_program_id INTEGER NOT NULL,
  person_with_albinism_id INTEGER NOT NULL,
  PRIMARY KEY (education_program_id, person_with_albinism_id),
  FOREIGN KEY (education_program_id) REFERENCES education_programs (id),
  FOREIGN KEY (person_with_albinism_id) REFERENCES person_with_albinisms (person_with_albinism_id)
);
