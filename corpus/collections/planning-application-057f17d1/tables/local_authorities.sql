CREATE TABLE local_authorities (
  authority_id INTEGER NOT NULL,
  authority_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  decision VARCHAR(32),
  municipality_id INTEGER,
  PRIMARY KEY (authority_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id)
);
