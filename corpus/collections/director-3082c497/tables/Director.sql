CREATE TABLE Director (
  id INTEGER NOT NULL,
  directorId INTEGER,
  fullName VARCHAR(36),
  roleType VARCHAR(42),
  appointmentDate DATE,
  status VARCHAR(32),
  boardId INTEGER,
  committeeId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (boardId) REFERENCES Board (boardId),
  FOREIGN KEY (committeeId) REFERENCES BoardCommittee (committeeId)
);
