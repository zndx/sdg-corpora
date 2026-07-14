CREATE TABLE managed_investment_schemes (
  id INTEGER NOT NULL,
  arsn VARCHAR(32),
  scheme_name VARCHAR(32),
  status VARCHAR(32),
  listing_status VARCHAR(32),
  responsible_entity VARCHAR(32),
  authorised_representative_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id)
);
