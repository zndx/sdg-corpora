CREATE TABLE BoardCommitteeDirector (
  committeeId INTEGER NOT NULL,
  directorId INTEGER NOT NULL,
  PRIMARY KEY (committeeId, directorId),
  FOREIGN KEY (committeeId) REFERENCES BoardCommittee (committeeId),
  FOREIGN KEY (directorId) REFERENCES Director (id)
);
