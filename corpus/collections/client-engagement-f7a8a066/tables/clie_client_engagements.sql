CREATE TABLE clie_client_engagements (
  engagement_id INTEGER NOT NULL,
  client_name VARCHAR(32),
  industry_sector VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  financial_controller_id INTEGER,
  account_id VARCHAR(44),
  compliance_task_id INTEGER,
  PRIMARY KEY (engagement_id),
  FOREIGN KEY (financial_controller_id) REFERENCES clie_financial_controllers (financial_controller_id),
  FOREIGN KEY (account_id) REFERENCES clie_management_accounts (account_id),
  FOREIGN KEY (compliance_task_id) REFERENCES clie_compliance_tasks (compliance_task_id)
);
