CREATE TABLE interviewers_questions (
  interviewer_id INTEGER NOT NULL,
  interview_question_id INTEGER NOT NULL,
  PRIMARY KEY (interviewer_id, interview_question_id),
  FOREIGN KEY (interviewer_id) REFERENCES interviewers (id),
  FOREIGN KEY (interview_question_id) REFERENCES interview_questions (id)
);
