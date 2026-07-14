CREATE TABLE corporate_newses (
  news_id INTEGER NOT NULL,
  headline VARCHAR(32),
  event_type VARCHAR(32),
  publication_date DATE,
  source_url VARCHAR(65),
  impact_level VARCHAR(32),
  organization_id INTEGER,
  candidate_profile_id INTEGER,
  PRIMARY KEY (news_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (candidate_profile_id) REFERENCES candidate_profiles (candidate_profile_id)
);
