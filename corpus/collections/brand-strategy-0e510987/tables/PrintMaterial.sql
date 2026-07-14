CREATE TABLE PrintMaterial (
  materialId INTEGER NOT NULL,
  materialType VARCHAR(32),
  printDate DATE,
  quantity INTEGER,
  paperType VARCHAR(32),
  finish VARCHAR(32),
  status VARCHAR(32),
  identityId VARCHAR(44),
  createdAt TIMESTAMP,
  PRIMARY KEY (materialId),
  FOREIGN KEY (identityId) REFERENCES BrandIdentity (identityId)
);
