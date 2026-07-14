CREATE TABLE victims (
  id INTEGER NOT NULL,
  victim_id VARCHAR(44),
  full_name VARCHAR(36),
  date_of_birth DATE,
  contact_number VARCHAR(32),
  safety_plan_status VARCHAR(32),
  crisis_call_count INTEGER,
  referral_status VARCHAR(32),
  legal_advocate_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_advocate_id) REFERENCES legal_advocates (legal_advocate_id)
);
