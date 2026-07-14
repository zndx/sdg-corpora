CREATE TABLE IntegratedWasteSystemWasteStream (
  systemId INTEGER NOT NULL,
  streamId INTEGER NOT NULL,
  PRIMARY KEY (systemId, streamId),
  FOREIGN KEY (systemId) REFERENCES IntegratedWasteSystem (id),
  FOREIGN KEY (streamId) REFERENCES WasteStream (id)
);
