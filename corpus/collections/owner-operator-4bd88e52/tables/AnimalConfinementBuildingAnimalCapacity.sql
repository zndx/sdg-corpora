CREATE TABLE AnimalConfinementBuildingAnimalCapacity (
  buildingId INTEGER NOT NULL,
  capacityId INTEGER NOT NULL,
  PRIMARY KEY (buildingId, capacityId),
  FOREIGN KEY (buildingId) REFERENCES AnimalConfinementBuilding (id),
  FOREIGN KEY (capacityId) REFERENCES AnimalCapacity (capacityId)
);
