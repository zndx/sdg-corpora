CREATE TABLE protection_orders (
  id INTEGER NOT NULL,
  order_id VARCHAR(32),
  issue_date TIMESTAMP,
  expiration_date TIMESTAMP,
  order_type VARCHAR(32),
  court_case_number VARCHAR(32),
  status VARCHAR(32),
  victim_id INTEGER,
  offender_id INTEGER,
  legal_advocate_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (victim_id) REFERENCES victims (id),
  FOREIGN KEY (offender_id) REFERENCES offenders (id),
  FOREIGN KEY (legal_advocate_id) REFERENCES legal_advocates (legal_advocate_id)
);
