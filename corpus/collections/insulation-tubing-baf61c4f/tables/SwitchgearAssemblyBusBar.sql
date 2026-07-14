CREATE TABLE SwitchgearAssemblyBusBar (
  assemblyId INTEGER NOT NULL,
  barId INTEGER NOT NULL,
  PRIMARY KEY (assemblyId, barId),
  FOREIGN KEY (assemblyId) REFERENCES SwitchgearAssembly (assemblyId),
  FOREIGN KEY (barId) REFERENCES BusBar (id)
);
