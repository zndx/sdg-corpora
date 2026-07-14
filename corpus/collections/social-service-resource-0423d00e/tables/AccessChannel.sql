CREATE TABLE AccessChannel (
  channelId INTEGER NOT NULL,
  channelIdentifier VARCHAR(32),
  channelType VARCHAR(32),
  urlOrEndpoint VARCHAR(68),
  supportsMultilingual BOOLEAN,
  isFree BOOLEAN,
  organizationId INTEGER,
  createdAt TIMESTAMP,
  updatedAt TIMESTAMP,
  PRIMARY KEY (channelId),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id)
);
