CREATE TABLE shareholders (
  shareholder_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  legal_name VARCHAR(32),
  shareholder_type VARCHAR(32),
  registration_date DATE,
  is_proxy_holder VARCHAR(32),
  share_id INTEGER,
  annual_general_meeting_id INTEGER,
  PRIMARY KEY (shareholder_id),
  FOREIGN KEY (share_id) REFERENCES shares (id),
  FOREIGN KEY (annual_general_meeting_id) REFERENCES annual_general_meetings (id)
);
