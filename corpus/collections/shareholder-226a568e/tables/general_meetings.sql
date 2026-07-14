CREATE TABLE general_meetings (
  id INTEGER NOT NULL,
  meeting_id VARCHAR(44),
  meeting_date TIMESTAMP,
  meeting_type VARCHAR(32),
  quorum_met BOOLEAN,
  agenda_items VARCHAR(32),
  minute_url VARCHAR(55),
  company_id VARCHAR(32),
  financial_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (financial_report_id) REFERENCES financial_reports (id)
);
