CREATE TABLE Participant (
  participantId INTEGER NOT NULL,
  participantIdentifier VARCHAR(32),
  firstName VARCHAR(32),
  lastName VARCHAR(32),
  ageGroup VARCHAR(32),
  hasPhotoID BOOLEAN,
  isSupervisor BOOLEAN,
  registrationDate TIMESTAMP,
  isSupervisedByParticipantId INTEGER,
  PRIMARY KEY (participantId),
  FOREIGN KEY (isSupervisedByParticipantId) REFERENCES Participant (participantId)
);
