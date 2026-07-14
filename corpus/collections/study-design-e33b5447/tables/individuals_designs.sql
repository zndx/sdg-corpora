CREATE TABLE individuals_designs (
  individual_participant_id VARCHAR(44) NOT NULL,
  study_design_id INTEGER NOT NULL,
  PRIMARY KEY (individual_participant_id, study_design_id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id)
);
