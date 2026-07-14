CREATE TABLE infrastructure_projects (
  id INTEGER NOT NULL,
  project_identifier VARCHAR(32),
  project_name VARCHAR(32),
  project_type VARCHAR(32),
  total_cost DECIMAL,
  financed_amount DECIMAL,
  start_date TIMESTAMP,
  completion_date TIMESTAMP,
  project_status VARCHAR(32),
  economic_development_bank_id INTEGER,
  underserved_community_id INTEGER,
  small_business_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (economic_development_bank_id) REFERENCES economic_development_banks (economic_development_bank_id),
  FOREIGN KEY (underserved_community_id) REFERENCES underserved_communities (underserved_community_id),
  FOREIGN KEY (small_business_id) REFERENCES small_businesses (id)
);
