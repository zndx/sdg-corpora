CREATE TABLE investors (
  investor_id INTEGER NOT NULL,
  investor_name VARCHAR(32),
  registration_date DATE,
  total_invested DECIMAL,
  contact_phone VARCHAR(32),
  complaint_record_id INTEGER,
  PRIMARY KEY (investor_id),
  FOREIGN KEY (complaint_record_id) REFERENCES complaint_records (id)
);
