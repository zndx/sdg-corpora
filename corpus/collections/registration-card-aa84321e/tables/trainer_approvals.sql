CREATE TABLE trainer_approvals (
  trainer_approval_id INTEGER NOT NULL,
  approval_id INTEGER,
  approval_type VARCHAR(32),
  grant_date DATE,
  expiry_date DATE,
  vat_excluded_price VARCHAR(32),
  trainer_id INTEGER,
  PRIMARY KEY (trainer_approval_id),
  FOREIGN KEY (trainer_id) REFERENCES trainers (id)
);
