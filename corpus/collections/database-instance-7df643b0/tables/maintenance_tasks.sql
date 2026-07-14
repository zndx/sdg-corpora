CREATE TABLE maintenance_tasks (
  id INTEGER NOT NULL,
  task_id VARCHAR(32),
  task_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  tool_used VARCHAR(32),
  d_b_a_id INTEGER,
  instance_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (d_b_a_id) REFERENCES d_b_as (d_b_a_id),
  FOREIGN KEY (instance_id) REFERENCES database_instances (instance_id)
);
