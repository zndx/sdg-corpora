CREATE TABLE IntelligenceUnitIntelligenceAnalyst (
  unitId INTEGER NOT NULL,
  analystId INTEGER NOT NULL,
  PRIMARY KEY (unitId, analystId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id),
  FOREIGN KEY (analystId) REFERENCES IntelligenceAnalyst (analystId)
);
