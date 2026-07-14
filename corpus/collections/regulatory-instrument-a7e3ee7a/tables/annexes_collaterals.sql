CREATE TABLE annexes_collaterals (
  credit_support_annex_id INTEGER NOT NULL,
  collateral_id INTEGER NOT NULL,
  PRIMARY KEY (credit_support_annex_id, collateral_id),
  FOREIGN KEY (credit_support_annex_id) REFERENCES credit_support_annexes (credit_support_annex_id),
  FOREIGN KEY (collateral_id) REFERENCES collaterals (id)
);
