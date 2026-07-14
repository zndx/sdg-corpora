CREATE TABLE NHSBoard (
  id INTEGER NOT NULL,
  boardName VARCHAR(32),
  isMainland BOOLEAN,
  regionCode VARCHAR(40),
  targetId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (targetId) REFERENCES CancerWaitingTimeTarget (targetId)
);
