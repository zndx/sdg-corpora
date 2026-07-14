CREATE TABLE states (
  state_code INTEGER NOT NULL,
  state_name VARCHAR(32),
  population INTEGER,
  gdp DECIMAL,
  pesticide_ban_status BOOLEAN,
  happy_planet_rank INTEGER,
  governor_id INTEGER,
  legislative_act_id INTEGER,
  index_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (state_code),
  FOREIGN KEY (governor_id) REFERENCES governors (id),
  FOREIGN KEY (legislative_act_id) REFERENCES legislative_acts (legislative_act_id),
  FOREIGN KEY (index_id) REFERENCES health_indexes (index_id)
);
