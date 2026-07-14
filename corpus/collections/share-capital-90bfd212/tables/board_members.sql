CREATE TABLE board_members (
  id INTEGER NOT NULL,
  member_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  is_employee VARCHAR(32),
  appointment_year INTEGER,
  fee_amount DECIMAL,
  currency_code VARCHAR(44),
  nomination_committee_id INTEGER,
  fee_resolution_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (nomination_committee_id) REFERENCES nomination_committees (nomination_committee_id),
  FOREIGN KEY (fee_resolution_id) REFERENCES fee_resolutions (id)
);
