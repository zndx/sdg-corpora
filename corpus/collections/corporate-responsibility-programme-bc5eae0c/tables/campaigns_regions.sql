CREATE TABLE campaigns_regions (
  campaign_id INTEGER NOT NULL,
  geographic_region_id INTEGER NOT NULL,
  PRIMARY KEY (campaign_id, geographic_region_id),
  FOREIGN KEY (campaign_id) REFERENCES campaigns (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (id)
);
