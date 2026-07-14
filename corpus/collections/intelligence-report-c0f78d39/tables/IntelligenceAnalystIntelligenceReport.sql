CREATE TABLE IntelligenceAnalystIntelligenceReport (
  analystId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (analystId, reportId),
  FOREIGN KEY (analystId) REFERENCES IntelligenceAnalyst (analystId),
  FOREIGN KEY (reportId) REFERENCES IntelligenceReport (id)
);
