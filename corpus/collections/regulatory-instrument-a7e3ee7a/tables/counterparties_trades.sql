CREATE TABLE counterparties_trades (
  financial_counterparty_id INTEGER NOT NULL,
  o_t_c_derivative_trade_id INTEGER NOT NULL,
  PRIMARY KEY (financial_counterparty_id, o_t_c_derivative_trade_id),
  FOREIGN KEY (financial_counterparty_id) REFERENCES financial_counterparties (financial_counterparty_id),
  FOREIGN KEY (o_t_c_derivative_trade_id) REFERENCES o_t_c_derivative_trades (id)
);
