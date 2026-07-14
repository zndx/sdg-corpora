CREATE TABLE dono_donations (
  donation_id INTEGER NOT NULL,
  amount DECIMAL,
  is_anonymous BOOLEAN,
  is_memorial BOOLEAN,
  is_honor BOOLEAN,
  donation_date DATE,
  donor_id VARCHAR(44),
  honoree_id INTEGER,
  fund_id INTEGER,
  PRIMARY KEY (donation_id),
  FOREIGN KEY (donor_id) REFERENCES dono_donors (donor_id),
  FOREIGN KEY (honoree_id) REFERENCES dono_honorees (honoree_id),
  FOREIGN KEY (fund_id) REFERENCES dono_funds (id)
);
