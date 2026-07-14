CREATE TABLE LogicModelCausalAssumption (
  modelId INTEGER NOT NULL,
  assumptionId INTEGER NOT NULL,
  PRIMARY KEY (modelId, assumptionId),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id),
  FOREIGN KEY (assumptionId) REFERENCES CausalAssumption (assumptionId)
);
