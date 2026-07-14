CREATE TABLE InformationEnvironmentInteroperabilityStandard (
  environmentId INTEGER NOT NULL,
  standardId INTEGER NOT NULL,
  PRIMARY KEY (environmentId, standardId),
  FOREIGN KEY (environmentId) REFERENCES InformationEnvironment (id),
  FOREIGN KEY (standardId) REFERENCES InteroperabilityStandard (id)
);
