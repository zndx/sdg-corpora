CREATE TABLE ServiceOrganizationHotline (
  organizationId INTEGER NOT NULL,
  hotlineId INTEGER NOT NULL,
  PRIMARY KEY (organizationId, hotlineId),
  FOREIGN KEY (organizationId) REFERENCES ServiceOrganization (id),
  FOREIGN KEY (hotlineId) REFERENCES Hotline (id)
);
