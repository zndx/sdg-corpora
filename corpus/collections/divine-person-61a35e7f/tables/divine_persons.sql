CREATE TABLE divine_persons (
  id INTEGER NOT NULL,
  has_name VARCHAR(32),
  has_role VARCHAR(32),
  has_nature VARCHAR(32),
  has_position VARCHAR(32),
  divine_act_id INTEGER,
  theological_proposition_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_act_id) REFERENCES divine_acts (id),
  FOREIGN KEY (theological_proposition_id) REFERENCES theological_propositions (id)
);
