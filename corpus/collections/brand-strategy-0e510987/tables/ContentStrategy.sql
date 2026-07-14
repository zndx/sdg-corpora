CREATE TABLE ContentStrategy (
  id INTEGER NOT NULL,
  contentId VARCHAR(44),
  contentTitle VARCHAR(32),
  contentType VARCHAR(32),
  publishDate TIMESTAMP,
  status VARCHAR(32),
  conversionRate DECIMAL,
  platform VARCHAR(32),
  strategyCampaignId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (strategyCampaignId) REFERENCES CampaignStrategy (campaignId)
);
