CREATE TABLE programs_agencies (
  bailout_program_id INTEGER NOT NULL,
  government_agency_id INTEGER NOT NULL,
  PRIMARY KEY (bailout_program_id, government_agency_id),
  FOREIGN KEY (bailout_program_id) REFERENCES bailout_programs (bailout_program_id),
  FOREIGN KEY (government_agency_id) REFERENCES government_agencies (id)
);
