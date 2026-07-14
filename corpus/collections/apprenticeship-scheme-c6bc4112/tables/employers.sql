CREATE TABLE employers (
  id INTEGER NOT NULL,
  employer_id VARCHAR(61),
  name VARCHAR(32),
  sector VARCHAR(32),
  total_workforce INTEGER,
  apprentice_count INTEGER,
  reclassification_rate DECIMAL,
  scheme_id VARCHAR(44),
  apprenticeship_participant_id INTEGER,
  funding_instrument_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (apprenticeship_participant_id) REFERENCES apprenticeship_participants (apprenticeship_participant_id),
  FOREIGN KEY (funding_instrument_id) REFERENCES funding_instruments (id)
);
