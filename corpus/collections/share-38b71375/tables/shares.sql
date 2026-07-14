CREATE TABLE shares (
  id INTEGER NOT NULL,
  identifier VARCHAR(32),
  nominal_value DECIMAL,
  voting_rights INTEGER,
  issuance_date DATE,
  current_status VARCHAR(32),
  shareholder_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (shareholder_id)
);
