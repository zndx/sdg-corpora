CREATE TABLE FishermanFishermanReport (
  fishermanId INTEGER NOT NULL,
  reportId INTEGER NOT NULL,
  PRIMARY KEY (fishermanId, reportId),
  FOREIGN KEY (fishermanId) REFERENCES Fisherman (id),
  FOREIGN KEY (reportId) REFERENCES FishermanReport (reportId)
);
