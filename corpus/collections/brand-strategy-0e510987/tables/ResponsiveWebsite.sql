CREATE TABLE ResponsiveWebsite (
  websiteId VARCHAR(66) NOT NULL,
  domainName VARCHAR(32),
  launchDate DATE,
  conversionRate DECIMAL,
  trafficSource VARCHAR(32),
  mobileOptimized BOOLEAN,
  cmsPlatform VARCHAR(32),
  PRIMARY KEY (websiteId)
);
