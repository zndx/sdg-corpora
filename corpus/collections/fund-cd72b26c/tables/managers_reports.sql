CREATE TABLE managers_reports (
  fund_manager_id INTEGER NOT NULL,
  performance_report_id INTEGER NOT NULL,
  PRIMARY KEY (fund_manager_id, performance_report_id),
  FOREIGN KEY (fund_manager_id) REFERENCES fund_managers (fund_manager_id),
  FOREIGN KEY (performance_report_id) REFERENCES performance_reports (performance_report_id)
);
