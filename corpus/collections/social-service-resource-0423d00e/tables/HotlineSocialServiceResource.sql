CREATE TABLE HotlineSocialServiceResource (
  hotlineId INTEGER NOT NULL,
  resourceId INTEGER NOT NULL,
  PRIMARY KEY (hotlineId, resourceId),
  FOREIGN KEY (hotlineId) REFERENCES Hotline (id),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id)
);
