CREATE TABLE SocialServiceResourceAccessChannel (
  resourceId INTEGER NOT NULL,
  channelId INTEGER NOT NULL,
  PRIMARY KEY (resourceId, channelId),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id),
  FOREIGN KEY (channelId) REFERENCES AccessChannel (channelId)
);
