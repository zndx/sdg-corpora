CREATE TABLE adoption_spirits (
  id INTEGER NOT NULL,
  spirit_id VARCHAR(44),
  bestowal_date TIMESTAMP,
  spirit_type VARCHAR(32),
  function_description VARCHAR(32),
  PRIMARY KEY (id)
);
