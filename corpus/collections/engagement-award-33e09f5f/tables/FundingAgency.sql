CREATE TABLE FundingAgency (
  agencyId INTEGER NOT NULL,
  agencyName VARCHAR(37),
  foundingYear INTEGER,
  agencyType VARCHAR(32),
  authorizationSource VARCHAR(32),
  headquartersCity VARCHAR(32),
  panelId INTEGER,
  PRIMARY KEY (agencyId),
  FOREIGN KEY (panelId) REFERENCES ReviewPanel (id)
);
