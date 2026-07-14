CREATE TABLE units_makers (
  organizational_unit_id INTEGER NOT NULL,
  decision_maker_id INTEGER NOT NULL,
  PRIMARY KEY (organizational_unit_id, decision_maker_id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id),
  FOREIGN KEY (decision_maker_id) REFERENCES decision_makers (decision_maker_id)
);
