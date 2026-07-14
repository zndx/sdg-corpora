CREATE TABLE auto_repair_shops (
  id INTEGER NOT NULL,
  shop_id VARCHAR(44),
  shop_name VARCHAR(32),
  established_date DATE,
  shop_type VARCHAR(32),
  daily_production_target DECIMAL,
  current_daily_production DECIMAL,
  is_profitable BOOLEAN,
  diagnostic_tool_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (diagnostic_tool_id) REFERENCES diagnostic_tools (id)
);
