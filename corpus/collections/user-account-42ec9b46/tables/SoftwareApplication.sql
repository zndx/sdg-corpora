CREATE TABLE SoftwareApplication (
  id INTEGER NOT NULL,
  appId VARCHAR(44),
  appName VARCHAR(32),
  version VARCHAR(32),
  platform VARCHAR(32),
  isBlendedLearningTool BOOLEAN,
  serviceId INTEGER,
  deviceId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (serviceId) REFERENCES DigitalService (id),
  FOREIGN KEY (deviceId) REFERENCES UserDevice (id)
);
