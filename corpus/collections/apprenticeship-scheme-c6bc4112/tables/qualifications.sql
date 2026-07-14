CREATE TABLE qualifications (
  qualification_id VARCHAR(44) NOT NULL,
  title VARCHAR(32),
  level VARCHAR(32),
  issuing_body VARCHAR(32),
  credits INTEGER,
  awarded_date DATE,
  apprenticeship_participant_id INTEGER,
  training_framework_id INTEGER,
  gap_id VARCHAR(35),
  PRIMARY KEY (qualification_id),
  FOREIGN KEY (apprenticeship_participant_id) REFERENCES apprenticeship_participants (apprenticeship_participant_id),
  FOREIGN KEY (training_framework_id) REFERENCES training_frameworks (id),
  FOREIGN KEY (gap_id) REFERENCES skill_gaps (gap_id)
);
