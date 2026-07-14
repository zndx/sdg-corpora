CREATE TABLE processes_interviewers (
  hiring_process_id INTEGER NOT NULL,
  interviewer_id INTEGER NOT NULL,
  PRIMARY KEY (hiring_process_id, interviewer_id),
  FOREIGN KEY (hiring_process_id) REFERENCES hiring_processes (hiring_process_id),
  FOREIGN KEY (interviewer_id) REFERENCES interviewers (id)
);
