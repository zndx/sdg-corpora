CREATE TABLE action_items (
  id INTEGER NOT NULL,
  action_id INTEGER,
  description VARCHAR(32),
  due_date DATE,
  priority VARCHAR(32),
  status VARCHAR(32),
  director_id INTEGER,
  h_s_s_s_e_q_issue_id INTEGER,
  meeting_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (director_id) REFERENCES safety_directors (director_id),
  FOREIGN KEY (h_s_s_s_e_q_issue_id) REFERENCES h_s_s_s_e_q_issues (id),
  FOREIGN KEY (meeting_document_id) REFERENCES meeting_documents (id)
);
