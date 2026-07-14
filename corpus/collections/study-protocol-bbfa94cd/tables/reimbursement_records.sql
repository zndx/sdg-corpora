CREATE TABLE reimbursement_records (
  id INTEGER NOT NULL,
  reimbursement_id INTEGER,
  amount DECIMAL,
  payment_date TIMESTAMP,
  payer VARCHAR(32),
  policy_code VARCHAR(32),
  imaging_procedure_id INTEGER,
  imaging_facility_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (imaging_procedure_id) REFERENCES imaging_procedures (id),
  FOREIGN KEY (imaging_facility_id) REFERENCES imaging_facilities (imaging_facility_id)
);
