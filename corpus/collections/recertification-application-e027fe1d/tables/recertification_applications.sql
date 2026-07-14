CREATE TABLE recertification_applications (
  id INTEGER NOT NULL,
  application_id VARCHAR(32),
  submission_date TIMESTAMP,
  fee_amount DECIMAL,
  status VARCHAR(32),
  verification_status VARCHAR(33),
  ethics_pledge_signed BOOLEAN,
  ru_total_earned INTEGER,
  ru_required INTEGER,
  certified_professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (certified_professional_id) REFERENCES certified_professionals (certified_professional_id)
);
