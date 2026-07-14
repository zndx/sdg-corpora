CREATE TABLE support_systems (
  support_system_id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  system_name VARCHAR(32),
  is_technical_specification_bound BOOLEAN,
  operability_status VARCHAR(32),
  risk_significance_level VARCHAR(32),
  limiting_condition_of_operation_id INTEGER,
  hazard_barrier_id INTEGER,
  maintenance_action_id INTEGER,
  alternate_temporary_system_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (support_system_id),
  FOREIGN KEY (limiting_condition_of_operation_id) REFERENCES limiting_condition_of_operations (limiting_condition_of_operation_id),
  FOREIGN KEY (hazard_barrier_id) REFERENCES hazard_barriers (id),
  FOREIGN KEY (maintenance_action_id) REFERENCES maintenance_actions (id),
  FOREIGN KEY (alternate_temporary_system_id) REFERENCES alternate_temporary_systems (alternate_temporary_system_id)
);
