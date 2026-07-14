CREATE TABLE shareholders (
  id INTEGER NOT NULL,
  shareholder_id VARCHAR(39),
  shareholder_name VARCHAR(32),
  share_count INTEGER,
  ownership_percentage DECIMAL,
  is_foreign_owner VARCHAR(32),
  registration_date DATE,
  share_capital_id INTEGER,
  nomination_committee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (share_capital_id) REFERENCES share_capitals (id),
  FOREIGN KEY (nomination_committee_id) REFERENCES nomination_committees (nomination_committee_id)
);
