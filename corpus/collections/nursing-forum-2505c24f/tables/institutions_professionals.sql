CREATE TABLE institutions_professionals (
  educational_institution_id INTEGER NOT NULL,
  nursing_professional_id INTEGER NOT NULL,
  PRIMARY KEY (educational_institution_id, nursing_professional_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (id),
  FOREIGN KEY (nursing_professional_id) REFERENCES nursing_professionals (id)
);
