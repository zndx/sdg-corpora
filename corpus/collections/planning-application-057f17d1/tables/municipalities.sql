CREATE TABLE municipalities (
  id INTEGER NOT NULL,
  municipality_id VARCHAR(44),
  name VARCHAR(32),
  population INTEGER,
  density DECIMAL,
  garden_city_status BOOLEAN,
  authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (authority_id) REFERENCES local_authorities (authority_id)
);
