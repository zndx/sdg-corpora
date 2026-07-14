CREATE TABLE MembershipCategory (
  id INTEGER NOT NULL,
  categoryName VARCHAR(32),
  requiresMedicalLicense BOOLEAN,
  requiresBoardCertification BOOLEAN,
  requiresFellowshipTraining BOOLEAN,
  requiresPeerRecommendations INTEGER,
  requiresPublications INTEGER,
  charterId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (charterId) REFERENCES SocietyCharter (id)
);
