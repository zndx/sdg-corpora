CREATE TABLE interview_questions (
  id INTEGER NOT NULL,
  question_id VARCHAR(44),
  question_text VARCHAR(32),
  category VARCHAR(32),
  is_panel_question BOOLEAN,
  is_behavioral BOOLEAN,
  priority_level INTEGER,
  role_code VARCHAR(32),
  hiring_process_id INTEGER,
  candidate_response_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code),
  FOREIGN KEY (hiring_process_id) REFERENCES hiring_processes (hiring_process_id),
  FOREIGN KEY (candidate_response_id) REFERENCES candidate_responses (id)
);
