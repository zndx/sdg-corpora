CREATE TABLE legislative_acts (
  legislative_act_id INTEGER NOT NULL,
  act_identifier VARCHAR(32),
  jurisdiction VARCHAR(32),
  enactment_date TIMESTAMP,
  status VARCHAR(32),
  target_chemical_class VARCHAR(32),
  legal_effect VARCHAR(32),
  PRIMARY KEY (legislative_act_id)
);
