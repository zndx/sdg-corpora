CREATE TABLE technicians (
  technician_id INTEGER NOT NULL,
  tech_id VARCHAR(44),
  full_name VARCHAR(36),
  hourly_rate DECIMAL,
  skill_level VARCHAR(32),
  is_owner VARCHAR(32),
  daily_tasks_completed INTEGER,
  auto_repair_shop_id INTEGER,
  repair_job_id INTEGER,
  PRIMARY KEY (technician_id),
  FOREIGN KEY (auto_repair_shop_id) REFERENCES auto_repair_shops (auto_repair_shop_id),
  FOREIGN KEY (repair_job_id) REFERENCES repair_jobs (id)
);
