CREATE TABLE CorporateEntity (
  id INTEGER NOT NULL,
  entityId VARCHAR(44),
  legalName VARCHAR(32),
  incorporationDate DATE,
  jurisdiction VARCHAR(32),
  stockCode VARCHAR(44),
  entityType VARCHAR(33),
  boardId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (boardId) REFERENCES Board (boardId)
);
