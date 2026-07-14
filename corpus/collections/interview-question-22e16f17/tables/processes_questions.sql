CREATE TABLE processes_questions (
  hiring_process_id INTEGER NOT NULL,
  interview_question_id INTEGER NOT NULL,
  PRIMARY KEY (hiring_process_id, interview_question_id),
  FOREIGN KEY (hiring_process_id) REFERENCES hiring_processes (hiring_process_id),
  FOREIGN KEY (interview_question_id) REFERENCES interview_questions (id)
);
