CREATE TABLE legislative_acts (
  act_number VARCHAR(32) NOT NULL,
  short_title VARCHAR(32),
  enactment_date TIMESTAMP,
  assent_date DATE,
  jurisdiction VARCHAR(32),
  status VARCHAR(32),
  amends_act_number VARCHAR(32),
  legislative_body_id INTEGER,
  PRIMARY KEY (act_number),
  FOREIGN KEY (amends_act_number) REFERENCES legislative_acts (act_number),
  FOREIGN KEY (legislative_body_id) REFERENCES legislative_bodies (id)
);
