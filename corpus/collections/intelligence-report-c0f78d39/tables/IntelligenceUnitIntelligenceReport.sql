CREATE TABLE IntelligenceUnitIntelligenceReport (
  unitId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (unitId, reportId),
  FOREIGN KEY (unitId) REFERENCES IntelligenceUnit (id),
  FOREIGN KEY (reportId) REFERENCES IntelligenceReport (id)
);
