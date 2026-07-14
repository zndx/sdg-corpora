CREATE TABLE neuroplasticity_events (
  event_i_d VARCHAR(32) NOT NULL,
  event_date TIMESTAMP,
  brain_region VARCHAR(32),
  trigger_type VARCHAR(32),
  intensity DECIMAL,
  outcome VARCHAR(32),
  cognitive_capacity_id INTEGER,
  research_institution_id INTEGER,
  PRIMARY KEY (event_i_d),
  FOREIGN KEY (cognitive_capacity_id) REFERENCES cognitive_capacities (cognitive_capacity_id),
  FOREIGN KEY (research_institution_id) REFERENCES research_institutions (research_institution_id)
);
