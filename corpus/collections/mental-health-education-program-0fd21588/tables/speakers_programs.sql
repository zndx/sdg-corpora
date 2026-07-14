CREATE TABLE speakers_programs (
  trained_speaker_id INTEGER NOT NULL,
  mental_health_education_program_id INTEGER NOT NULL,
  PRIMARY KEY (trained_speaker_id, mental_health_education_program_id),
  FOREIGN KEY (trained_speaker_id) REFERENCES trained_speakers (id),
  FOREIGN KEY (mental_health_education_program_id) REFERENCES mental_health_education_programs (mental_health_education_program_id)
);
