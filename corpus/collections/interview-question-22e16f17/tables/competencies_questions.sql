CREATE TABLE competencies_questions (
  competency_id INTEGER NOT NULL,
  interview_question_id INTEGER NOT NULL,
  PRIMARY KEY (competency_id, interview_question_id),
  FOREIGN KEY (competency_id) REFERENCES competencies (competency_id),
  FOREIGN KEY (interview_question_id) REFERENCES interview_questions (id)
);
