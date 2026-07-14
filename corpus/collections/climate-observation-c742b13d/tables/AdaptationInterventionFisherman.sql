CREATE TABLE AdaptationInterventionFisherman (
  interventionId INTEGER NOT NULL,
  fishermanId INTEGER NOT NULL,
  PRIMARY KEY (interventionId, fishermanId),
  FOREIGN KEY (interventionId) REFERENCES AdaptationIntervention (id),
  FOREIGN KEY (fishermanId) REFERENCES Fisherman (id)
);
