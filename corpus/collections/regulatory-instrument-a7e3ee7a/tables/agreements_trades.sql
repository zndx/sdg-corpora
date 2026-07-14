CREATE TABLE agreements_trades (
  netting_agreement_id INTEGER NOT NULL,
  o_t_c_derivative_trade_id INTEGER NOT NULL,
  PRIMARY KEY (netting_agreement_id, o_t_c_derivative_trade_id),
  FOREIGN KEY (netting_agreement_id) REFERENCES netting_agreements (id),
  FOREIGN KEY (o_t_c_derivative_trade_id) REFERENCES o_t_c_derivative_trades (id)
);
