CREATE TABLE parent_corporations (
  parent_corporation_id INTEGER NOT NULL,
  corp_id VARCHAR(44),
  corp_name VARCHAR(32),
  country_of_origin VARCHAR(32),
  industry_sector VARCHAR(32),
  founding_year INTEGER,
  is_publicly_traded BOOLEAN,
  PRIMARY KEY (parent_corporation_id)
);
