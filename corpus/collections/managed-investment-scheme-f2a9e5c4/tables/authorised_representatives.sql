CREATE TABLE authorised_representatives (
  id INTEGER NOT NULL,
  rep_id VARCHAR(35),
  rep_name VARCHAR(32),
  authorisation_date TIMESTAMP,
  authorisation_status VARCHAR(32),
  licensing_entity VARCHAR(32),
  PRIMARY KEY (id)
);
