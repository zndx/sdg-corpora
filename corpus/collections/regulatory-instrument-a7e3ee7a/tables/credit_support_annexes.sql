CREATE TABLE credit_support_annexes (
  credit_support_annex_id INTEGER NOT NULL,
  csa_identifier VARCHAR(32),
  netting_set VARCHAR(32),
  amendment_status VARCHAR(32),
  effective_date TIMESTAMP,
  termination_date TIMESTAMP,
  netting_agreement_id INTEGER,
  regulatory_instrument_id INTEGER,
  PRIMARY KEY (credit_support_annex_id),
  FOREIGN KEY (netting_agreement_id) REFERENCES netting_agreements (id),
  FOREIGN KEY (regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id)
);
