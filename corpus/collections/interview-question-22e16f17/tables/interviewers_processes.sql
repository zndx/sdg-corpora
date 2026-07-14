CREATE TABLE interviewers_processes (
  interviewer_id INTEGER NOT NULL,
  hiring_process_id INTEGER NOT NULL,
  PRIMARY KEY (interviewer_id, hiring_process_id),
  FOREIGN KEY (interviewer_id) REFERENCES interviewers (id),
  FOREIGN KEY (hiring_process_id) REFERENCES hiring_processes (hiring_process_id)
);
