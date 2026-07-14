CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  legal_name VARCHAR(32),
  industry_sector VARCHAR(32),
  headquarters_location VARCHAR(32),
  global_presence BOOLEAN,
  founded_year INTEGER,
  news_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (news_id) REFERENCES corporate_newses (news_id)
);
