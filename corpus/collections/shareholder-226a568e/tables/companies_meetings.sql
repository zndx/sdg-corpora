CREATE TABLE companies_meetings (
  company_id VARCHAR(32) NOT NULL,
  general_meeting_id INTEGER NOT NULL,
  PRIMARY KEY (company_id, general_meeting_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (general_meeting_id) REFERENCES general_meetings (id)
);
