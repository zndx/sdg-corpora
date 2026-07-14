CREATE TABLE shareholders (
  id INTEGER NOT NULL,
  shareholder_id VARCHAR(39),
  name VARCHAR(34),
  type VARCHAR(32),
  registration_date TIMESTAMP,
  contact_email VARCHAR(32),
  share_count INTEGER,
  company_id VARCHAR(32),
  general_meeting_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (general_meeting_id) REFERENCES general_meetings (id)
);
