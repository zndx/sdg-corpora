CREATE TABLE SwitchgearAssembly (
  assemblyId INTEGER NOT NULL,
  voltageLevel DECIMAL,
  installationDate TIMESTAMP,
  manufacturer VARCHAR(46),
  status VARCHAR(32),
  PRIMARY KEY (assemblyId)
);
