CREATE TABLE BrandIdentityPrintMaterial (
  identityId VARCHAR(44) NOT NULL,
  materialId INTEGER NOT NULL,
  PRIMARY KEY (identityId, materialId),
  FOREIGN KEY (identityId) REFERENCES BrandIdentity (identityId),
  FOREIGN KEY (materialId) REFERENCES PrintMaterial (materialId)
);
