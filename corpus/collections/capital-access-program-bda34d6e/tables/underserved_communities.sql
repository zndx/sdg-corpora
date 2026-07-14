CREATE TABLE underserved_communities (
  underserved_community_id INTEGER NOT NULL,
  community_identifier VARCHAR(32),
  community_name VARCHAR(32),
  geographic_boundary VARCHAR(32),
  population_density DECIMAL,
  median_income DECIMAL,
  access_level VARCHAR(32),
  targeted_status BOOLEAN,
  small_business_id INTEGER,
  capital_access_program_id INTEGER,
  PRIMARY KEY (underserved_community_id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id),
  FOREIGN KEY (capital_access_program_id) REFERENCES capital_access_programs (capital_access_program_id)
);
