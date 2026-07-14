CREATE TABLE legal_acts (
  legal_act_id INTEGER NOT NULL,
  act_identifier VARCHAR(32),
  act_title VARCHAR(32),
  issuing_body VARCHAR(32),
  effective_date TIMESTAMP,
  legal_status VARCHAR(32),
  fund_operation_id INTEGER,
  cites_legal_act_id INTEGER,
  PRIMARY KEY (legal_act_id),
  FOREIGN KEY (fund_operation_id) REFERENCES fund_operations (fund_operation_id),
  FOREIGN KEY (cites_legal_act_id) REFERENCES legal_acts (legal_act_id)
);
