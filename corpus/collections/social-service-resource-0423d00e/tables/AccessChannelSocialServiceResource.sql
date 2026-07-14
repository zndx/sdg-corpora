CREATE TABLE AccessChannelSocialServiceResource (
  channelId INTEGER NOT NULL,
  resourceId INTEGER NOT NULL,
  PRIMARY KEY (channelId, resourceId),
  FOREIGN KEY (channelId) REFERENCES AccessChannel (channelId),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id)
);
