CREATE TABLE executives (
  id INTEGER NOT NULL,
  executive_id VARCHAR(44),
  executive_name VARCHAR(32),
  title VARCHAR(32),
  decision_authority VARCHAR(32),
  report_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (report_id) REFERENCES sales_reports (report_id)
);
