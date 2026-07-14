CREATE TABLE TrophyFee (
  id INTEGER NOT NULL,
  feeId VARCHAR(44),
  scoringRange VARCHAR(32),
  surchargeAmount DECIMAL,
  currency VARCHAR(32),
  appliesToTrophy VARCHAR(32),
  serviceId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (serviceId) REFERENCES HuntingService (serviceId)
);
