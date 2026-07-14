CREATE TABLE regulatory_authorities (
  id INTEGER NOT NULL,
  authority_name VARCHAR(32),
  website_url VARCHAR(55),
  effective_date DATE,
  oversight_scope VARCHAR(32),
  PRIMARY KEY (id)
);
