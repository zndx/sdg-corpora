CREATE TABLE academic_lectures (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  title VARCHAR(32),
  lecture_type VARCHAR(32),
  named_after VARCHAR(32),
  scheduled_date TIMESTAMP,
  venue_room VARCHAR(32),
  academic_conference_region_code VARCHAR(40),
  academic_researcher_id INTEGER,
  academic_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_region_code) REFERENCES academic_conferences (region_code),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id),
  FOREIGN KEY (academic_institution_id) REFERENCES academic_institutions (id)
);
