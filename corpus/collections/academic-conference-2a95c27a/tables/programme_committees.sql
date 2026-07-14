CREATE TABLE programme_committees (
  programme_committee_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  chair_name VARCHAR(32),
  selection_deadline TIMESTAMP,
  membership_limit VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  academic_researcher_id INTEGER,
  selects_speaker_academic_researcher_id INTEGER,
  academic_paper_id INTEGER,
  PRIMARY KEY (programme_committee_id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id),
  FOREIGN KEY (selects_speaker_academic_researcher_id) REFERENCES academic_researchers (id),
  FOREIGN KEY (academic_paper_id) REFERENCES academic_papers (id)
);
