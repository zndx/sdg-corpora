CREATE TABLE StatuteWithholdingRule (
  statuteId INTEGER NOT NULL,
  ruleId INTEGER NOT NULL,
  PRIMARY KEY (statuteId, ruleId),
  FOREIGN KEY (statuteId) REFERENCES Statute (statuteId),
  FOREIGN KEY (ruleId) REFERENCES WithholdingRule (id)
);
