CREATE TABLE Statute (
  statuteId INTEGER NOT NULL,
  statuteIdentifier VARCHAR(32),
  statuteName VARCHAR(32),
  enactmentDate DATE,
  sectionNumber VARCHAR(32),
  amends VARCHAR(32),
  PRIMARY KEY (statuteId)
);
