CREATE TABLE protocols_designs (
  ethical_protocol_id INTEGER NOT NULL,
  study_design_id INTEGER NOT NULL,
  PRIMARY KEY (ethical_protocol_id, study_design_id),
  FOREIGN KEY (ethical_protocol_id) REFERENCES ethical_protocols (id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id)
);
