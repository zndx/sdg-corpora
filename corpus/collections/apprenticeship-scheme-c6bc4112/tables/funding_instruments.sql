CREATE TABLE funding_instruments (
  id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  type VARCHAR(32),
  amount DECIMAL,
  currency VARCHAR(32),
  eligibility_criteria VARCHAR(32),
  effective_date DATE,
  scheme_id VARCHAR(44),
  employer_id INTEGER,
  apprenticeship_participant_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (employer_id) REFERENCES employers (id),
  FOREIGN KEY (apprenticeship_participant_id) REFERENCES apprenticeship_participants (apprenticeship_participant_id)
);
