CREATE TABLE capitals_shareholders (
  share_capital_id INTEGER NOT NULL,
  shareholder_id INTEGER NOT NULL,
  PRIMARY KEY (share_capital_id, shareholder_id),
  FOREIGN KEY (share_capital_id) REFERENCES share_capitals (id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (id)
);
