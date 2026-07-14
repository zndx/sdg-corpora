CREATE TABLE funds_reports (
  fund_id INTEGER NOT NULL,
  performance_report_id INTEGER NOT NULL,
  PRIMARY KEY (fund_id, performance_report_id),
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id),
  FOREIGN KEY (performance_report_id) REFERENCES performance_reports (performance_report_id)
);
