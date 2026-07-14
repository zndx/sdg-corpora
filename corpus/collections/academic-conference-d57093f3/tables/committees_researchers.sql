CREATE TABLE committees_researchers (
  steering_committee_id INTEGER NOT NULL,
  academic_researcher_id INTEGER NOT NULL,
  PRIMARY KEY (steering_committee_id, academic_researcher_id),
  FOREIGN KEY (steering_committee_id) REFERENCES steering_committees (steering_committee_id),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id)
);
