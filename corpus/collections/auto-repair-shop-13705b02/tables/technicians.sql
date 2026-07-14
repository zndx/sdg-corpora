CREATE TABLE technicians (
  id INTEGER NOT NULL,
  technician_id INTEGER,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  hourly_rate DECIMAL,
  skill_level VARCHAR(32),
  is_assigned_to_repair BOOLEAN,
  auto_repair_shop_id INTEGER,
  task_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (auto_repair_shop_id) REFERENCES auto_repair_shops (id),
  FOREIGN KEY (task_id) REFERENCES repair_tasks (task_id)
);
