CREATE TABLE wills (
  will_id INTEGER NOT NULL,
  testator_name VARCHAR(32),
  execution_date DATE,
  probate_filed BOOLEAN,
  executor_name VARCHAR(32),
  last_amendment_date DATE,
  estate_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (will_id),
  FOREIGN KEY (estate_id) REFERENCES estates (estate_id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
