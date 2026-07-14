CREATE TABLE dining_occasions (
  dining_occasion_id INTEGER NOT NULL,
  occasion_id VARCHAR(32),
  name VARCHAR(32),
  duration_minutes INTEGER,
  is_available BOOLEAN,
  pricing_tier_id INTEGER,
  PRIMARY KEY (dining_occasion_id),
  FOREIGN KEY (pricing_tier_id) REFERENCES pricing_tiers (id)
);
