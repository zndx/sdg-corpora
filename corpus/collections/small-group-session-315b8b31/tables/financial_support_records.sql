CREATE TABLE financial_support_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  record_date DATE,
  amount_needed DECIMAL,
  amount_given DECIMAL,
  funding_gap DECIMAL,
  support_status VARCHAR(32),
  marriage_prayer_focus_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (marriage_prayer_focus_id) REFERENCES marriage_prayer_focuses (id)
);
