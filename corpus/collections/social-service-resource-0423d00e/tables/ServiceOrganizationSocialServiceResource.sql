CREATE TABLE ServiceOrganizationSocialServiceResource (
  organizationId INTEGER NOT NULL,
  resourceId INTEGER NOT NULL,
  PRIMARY KEY (organizationId, resourceId),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id),
  FOREIGN KEY (resourceId) REFERENCES SocialServiceResource (id)
);
