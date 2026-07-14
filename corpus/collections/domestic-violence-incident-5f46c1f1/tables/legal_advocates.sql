CREATE TABLE legal_advocates (
  legal_advocate_id INTEGER NOT NULL,
  advocate_id VARCHAR(39),
  full_name VARCHAR(36),
  education_level VARCHAR(32),
  on_call_rotation VARCHAR(32),
  supervisor_id VARCHAR(35),
  case_load INTEGER,
  prosecutor_id INTEGER,
  protection_order_id INTEGER,
  PRIMARY KEY (legal_advocate_id),
  FOREIGN KEY (prosecutor_id) REFERENCES prosecutors (id),
  FOREIGN KEY (protection_order_id) REFERENCES protection_orders (id)
);
