CREATE TABLE fund_operations (
  fund_operation_id INTEGER NOT NULL,
  operation_code VARCHAR(44),
  operation_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  legal_act_id INTEGER,
  agent_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (fund_operation_id),
  FOREIGN KEY (legal_act_id) REFERENCES legal_acts (legal_act_id),
  FOREIGN KEY (agent_id) REFERENCES agents (agent_id)
);
