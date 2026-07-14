CREATE TABLE CorporateDivision (
  id INTEGER NOT NULL,
  divisionId VARCHAR(32),
  divisionName VARCHAR(32),
  parentOrganization VARCHAR(32),
  foundingDate DATE,
  targetClientele VARCHAR(32),
  PRIMARY KEY (id)
);
