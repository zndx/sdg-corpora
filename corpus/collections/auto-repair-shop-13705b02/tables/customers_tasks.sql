CREATE TABLE customers_tasks (
  customer_id INTEGER NOT NULL,
  task_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (customer_id, task_id),
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN KEY (task_id) REFERENCES repair_tasks (task_id)
);
