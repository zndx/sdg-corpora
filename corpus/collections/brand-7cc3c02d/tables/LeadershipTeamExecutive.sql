CREATE TABLE LeadershipTeamExecutive (
  teamId VARCHAR(32) NOT NULL,
  executiveId INTEGER NOT NULL,
  PRIMARY KEY (teamId, executiveId),
  FOREIGN KEY (teamId) REFERENCES LeadershipTeam (teamId),
  FOREIGN KEY (executiveId) REFERENCES Executive (executiveId)
);
