CREATE TABLE executive_leaders (
  executive_leader_id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  job_title VARCHAR(80),
  department VARCHAR(32),
  has_dotted_line_to VARCHAR(32),
  PRIMARY KEY (executive_leader_id)
);
