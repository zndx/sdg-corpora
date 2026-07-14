CREATE TABLE trades_counterparties (
  o_t_c_derivative_trade_id INTEGER NOT NULL,
  financial_counterparty_id INTEGER NOT NULL,
  PRIMARY KEY (o_t_c_derivative_trade_id, financial_counterparty_id),
  FOREIGN KEY (o_t_c_derivative_trade_id) REFERENCES o_t_c_derivative_trades (id),
  FOREIGN KEY (financial_counterparty_id) REFERENCES financial_counterparties (financial_counterparty_id)
);
