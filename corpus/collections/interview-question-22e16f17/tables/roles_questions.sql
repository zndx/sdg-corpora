CREATE TABLE roles_questions (
  role_code VARCHAR(32) NOT NULL,
  interview_question_id INTEGER NOT NULL,
  PRIMARY KEY (role_code, interview_question_id),
  FOREIGN KEY (role_code) REFERENCES job_roles (role_code),
  FOREIGN KEY (interview_question_id) REFERENCES interview_questions (id)
);
