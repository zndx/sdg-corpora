CREATE TABLE agents (
  agent_id INTEGER NOT NULL,
  agent_identifier VARCHAR(32),
  agent_name VARCHAR(32),
  appointment_date TIMESTAMP,
  termination_date TIMESTAMP,
  agent_type VARCHAR(32),
  board_of_governors_id INTEGER,
  fund_operation_id INTEGER,
  archive_location_id INTEGER,
  PRIMARY KEY (agent_id),
  FOREIGN KEY (board_of_governors_id) REFERENCES board_of_governorses (board_of_governors_id),
  FOREIGN KEY (fund_operation_id) REFERENCES fund_operations (fund_operation_id),
  FOREIGN KEY (archive_location_id) REFERENCES archive_locations (id)
);
