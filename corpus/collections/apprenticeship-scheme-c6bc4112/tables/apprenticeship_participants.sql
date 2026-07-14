CREATE TABLE apprenticeship_participants (
  apprenticeship_participant_id INTEGER NOT NULL,
  participant_id VARCHAR(44),
  age INTEGER,
  employment_status VARCHAR(32),
  gender VARCHAR(32),
  start_date DATE,
  completion_status VARCHAR(32),
  scheme_id VARCHAR(44),
  employer_id INTEGER,
  qualification_id VARCHAR(44),
  PRIMARY KEY (apprenticeship_participant_id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (employer_id) REFERENCES employers (id),
  FOREIGN KEY (qualification_id) REFERENCES qualifications (qualification_id)
);
