CREATE TABLE MobileApp (
  appId INTEGER NOT NULL,
  appName VARCHAR(32),
  platform VARCHAR(32),
  launchDate DATE,
  loadTime DECIMAL,
  activeUsers INTEGER,
  status VARCHAR(32),
  PRIMARY KEY (appId)
);
