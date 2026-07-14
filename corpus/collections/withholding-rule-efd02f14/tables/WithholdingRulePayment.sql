CREATE TABLE WithholdingRulePayment (
  ruleId INTEGER NOT NULL,
  paymentId INTEGER NOT NULL,
  PRIMARY KEY (ruleId, paymentId),
  FOREIGN KEY (ruleId) REFERENCES WithholdingRule (id),
  FOREIGN KEY (paymentId) REFERENCES Payment (id)
);
