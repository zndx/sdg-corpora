CREATE TABLE mental_health_education_programs (
  mental_health_education_program_id INTEGER NOT NULL,
  program_identifier VARCHAR(32),
  program_title VARCHAR(32),
  target_age_group VARCHAR(32),
  delivery_mode VARCHAR(32),
  is_evidence_based BOOLEAN,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  trained_speaker_id INTEGER,
  youth_demographic_id INTEGER,
  educational_venue_id INTEGER,
  PRIMARY KEY (mental_health_education_program_id),
  FOREIGN KEY (trained_speaker_id) REFERENCES trained_speakers (id),
  FOREIGN KEY (youth_demographic_id) REFERENCES youth_demographics (youth_demographic_id),
  FOREIGN KEY (educational_venue_id) REFERENCES educational_venues (educational_venue_id)
);
