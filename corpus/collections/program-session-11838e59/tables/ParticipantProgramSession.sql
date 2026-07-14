CREATE TABLE ParticipantProgramSession (
  participantId INTEGER NOT NULL,
  sessionId INTEGER NOT NULL,
  PRIMARY KEY (participantId, sessionId),
  FOREIGN KEY (participantId) REFERENCES Participant (participantId),
  FOREIGN KEY (sessionId) REFERENCES ProgramSession (id)
);
