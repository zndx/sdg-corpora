CREATE TABLE entities_accounts (
  school_district_entity_id INTEGER NOT NULL,
  social_media_account_id INTEGER NOT NULL,
  PRIMARY KEY (school_district_entity_id, social_media_account_id),
  FOREIGN KEY (school_district_entity_id) REFERENCES school_district_entities (school_district_entity_id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (social_media_account_id)
);
