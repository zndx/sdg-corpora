CREATE TABLE candidate_responses (
  id INTEGER NOT NULL,
  response_id VARCHAR(35),
  response_text VARCHAR(32),
  uses_s_t_a_r_method BOOLEAN,
  competency_demonstrated VARCHAR(32),
  rating_score DECIMAL,
  submitted_at TIMESTAMP,
  interview_question_id INTEGER,
  hiring_process_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (interview_question_id) REFERENCES interview_questions (id),
  FOREIGN KEY (hiring_process_id) REFERENCES hiring_processes (hiring_process_id)
);
