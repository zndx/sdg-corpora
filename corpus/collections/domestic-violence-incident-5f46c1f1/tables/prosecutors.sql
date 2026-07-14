CREATE TABLE prosecutors (
  id INTEGER NOT NULL,
  prosecutor_id VARCHAR(32),
  full_name VARCHAR(36),
  case_load INTEGER,
  court_assignment VARCHAR(32),
  legal_advocate_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_advocate_id) REFERENCES legal_advocates (legal_advocate_id)
);
