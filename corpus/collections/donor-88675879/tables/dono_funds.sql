CREATE TABLE dono_funds (
  id INTEGER NOT NULL,
  fund_id VARCHAR(32),
  fund_name VARCHAR(32),
  fund_description VARCHAR(32),
  donation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (donation_id) REFERENCES dono_donations (donation_id)
);
