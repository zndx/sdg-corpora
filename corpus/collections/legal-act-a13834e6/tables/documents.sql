CREATE TABLE documents (
  document_id INTEGER NOT NULL,
  document_identifier VARCHAR(32),
  document_title VARCHAR(32),
  creation_date TIMESTAMP,
  language VARCHAR(32),
  access_status VARCHAR(32),
  agent_id INTEGER,
  fund_operation_id INTEGER,
  archive_location_id INTEGER,
  legal_act_id INTEGER,
  PRIMARY KEY (document_id),
  FOREIGN KEY (agent_id) REFERENCES agents (agent_id),
  FOREIGN KEY (fund_operation_id) REFERENCES fund_operations (fund_operation_id),
  FOREIGN KEY (archive_location_id) REFERENCES archive_locations (id),
  FOREIGN KEY (legal_act_id) REFERENCES legal_acts (legal_act_id)
);
