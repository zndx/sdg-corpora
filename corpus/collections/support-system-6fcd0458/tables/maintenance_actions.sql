CREATE TABLE maintenance_actions (
  id INTEGER NOT NULL,
  maintenance_id VARCHAR(35),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  action_type VARCHAR(32),
  completes_on_schedule BOOLEAN,
  support_system_id INTEGER,
  limiting_condition_of_operation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (support_system_id) REFERENCES support_systems (support_system_id),
  FOREIGN KEY (limiting_condition_of_operation_id) REFERENCES limiting_condition_of_operations (limiting_condition_of_operation_id)
);
