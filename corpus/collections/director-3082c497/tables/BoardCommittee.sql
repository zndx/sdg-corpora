CREATE TABLE BoardCommittee (
  committeeId INTEGER NOT NULL,
  committeeName VARCHAR(32),
  establishmentDate DATE,
  status VARCHAR(32),
  directorId INTEGER,
  PRIMARY KEY (committeeId),
  FOREIGN KEY (directorId) REFERENCES Director (id)
);
