CREATE TABLE churches (
  id INTEGER NOT NULL,
  has_role VARCHAR(32),
  has_mission VARCHAR(32),
  has_unity_type VARCHAR(32),
  has_responsibility VARCHAR(32),
  humanity_id INTEGER,
  divine_person_id INTEGER,
  divine_act_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (humanity_id) REFERENCES humanities (id),
  FOREIGN KEY (divine_person_id) REFERENCES divine_persons (id),
  FOREIGN KEY (divine_act_id) REFERENCES divine_acts (id)
);
