CREATE TABLE FinancialPlanner (
  id INTEGER NOT NULL,
  plannerId VARCHAR(32),
  fullName VARCHAR(36),
  licenseNumber VARCHAR(32),
  specialization VARCHAR(32),
  yearsExperience INTEGER,
  employmentStatus VARCHAR(32),
  portfolioId INTEGER,
  clientId INTEGER,
  assistantId INTEGER,
  recordId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (portfolioId) REFERENCES InvestmentPortfolio (id),
  FOREIGN KEY (clientId) REFERENCES Client (id),
  FOREIGN KEY (assistantId) REFERENCES FinancialPlanningAssistant (id),
  FOREIGN KEY (recordId) REFERENCES ComplianceRecord (recordId)
);
