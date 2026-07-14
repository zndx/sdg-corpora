CREATE TABLE d_b_as (
  d_b_a_id INTEGER NOT NULL,
  dba_id VARCHAR(44),
  name VARCHAR(32),
  years_experience INTEGER,
  specialization VARCHAR(32),
  employer VARCHAR(40),
  instance_id VARCHAR(32),
  maintenance_task_id INTEGER,
  PRIMARY KEY (d_b_a_id),
  FOREIGN KEY (instance_id) REFERENCES database_instances (instance_id),
  FOREIGN KEY (maintenance_task_id) REFERENCES maintenance_tasks (id)
);
