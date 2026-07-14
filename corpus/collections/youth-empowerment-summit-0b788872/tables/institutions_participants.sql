CREATE TABLE institutions_participants (
  educational_institution_id INTEGER NOT NULL,
  youth_participant_id INTEGER NOT NULL,
  PRIMARY KEY (educational_institution_id, youth_participant_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (educational_institution_id),
  FOREIGN KEY (youth_participant_id) REFERENCES youth_participants (id)
);
