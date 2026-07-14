CREATE TABLE competencies_responses (
  competency_id INTEGER NOT NULL,
  candidate_response_id INTEGER NOT NULL,
  PRIMARY KEY (competency_id, candidate_response_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (competency_id),
  FOREIGN KEY (candidate_response_id) REFERENCES candidate_responses (id)
);
