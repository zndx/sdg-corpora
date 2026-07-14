CREATE TABLE MaterialSpecificationTestMethod (
  specificationId INTEGER NOT NULL,
  methodId INTEGER NOT NULL,
  PRIMARY KEY (specificationId, methodId),
  FOREIGN KEY (specificationId) REFERENCES MaterialSpecification (id),
  FOREIGN KEY (methodId) REFERENCES TestMethod (methodId)
);
