CREATE TABLE didactical_situations (
  situation_id VARCHAR(35) NOT NULL,
  title VARCHAR(32),
  period_start TIMESTAMP,
  period_end TIMESTAMP,
  status VARCHAR(32),
  description VARCHAR(32),
  didactic_instrument_id INTEGER,
  PRIMARY KEY (situation_id),
  FOREIGN KEY (didactic_instrument_id) REFERENCES didactic_instruments (id)
);
