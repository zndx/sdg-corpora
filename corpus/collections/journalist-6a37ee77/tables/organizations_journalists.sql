CREATE TABLE organizations_journalists (
  news_organization_id INTEGER NOT NULL,
  journalist_id INTEGER NOT NULL,
  PRIMARY KEY (news_organization_id, journalist_id),
  FOREIGN KEY (news_organization_id) REFERENCES news_organizations (id),
  FOREIGN KEY (journalist_id) REFERENCES journalists (journalist_id)
);
